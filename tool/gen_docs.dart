// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart' as yaml;
import 'package:http/http.dart' as http;

/// Source of truth for linter rules.
const rulesUrl =
    'https://raw.githubusercontent.com/dart-lang/site-www/main/src/_data/linter_rules.json';

/// Local cache of linter rules from [rulesUrl].
///
/// Relative to package root.
const rulesCacheFilePath = 'tool/rules.json';

/// Generated rules documentation markdown file.
///
/// Relative to package root.
const rulesMarkdownFilePath = 'rules.md';

/// Fetches the [rulesUrl] JSON description of all lints, saves a cached
/// summary of the relevant fields in [rulesCacheFilePath], and
/// updates [rulesMarkdownFilePath] to
///
/// Passing any command line argument disables generating documentation,
/// and makes this tool just verify that the doc is up-to-date with the
/// [rulesCacheFilePath]. (Which it always should be, since the two
/// are saved at the same time.)
void main(List<String> args) async {
  final verifyOnly = args.isNotEmpty;

  // Read lint rules.
  final rulesJson = await _fetchRulesJson(verifyOnly: verifyOnly);

  // Read existing generated Markdown documentation.
  final rulesMarkdownFile = _packageRelativeFile(rulesMarkdownFilePath);
  final rulesMarkdownContent = rulesMarkdownFile.readAsStringSync();

  if (verifyOnly) {
    print('Validating that ${rulesMarkdownFile.path} is up-to-date ...');
  } else {
    print('Regenerating ${rulesMarkdownFile.path} ...');
  }

  // Generate new documentation.
  var newRulesMarkdownContent =
      _updateMarkdown(rulesMarkdownContent, rulesJson);

  // If no documentation change, all is up-to-date.
  if (newRulesMarkdownContent == rulesMarkdownContent) {
    print('${rulesMarkdownFile.path} is up-to-date.');
    return;
  }

  /// Documentation has changed.
  if (verifyOnly) {
    print('${rulesMarkdownFile.path} is not up-to-date (lint tables need to be '
        'regenerated).');
    print('');
    print("Run 'dart tool/gen_docs.dart' to re-generate.");
    exit(1);
  } else {
    // Save [rulesMarkdownFilePath].
    rulesMarkdownFile.writeAsStringSync(newRulesMarkdownContent);
    print('Wrote ${rulesMarkdownFile.path}.');
  }
}

/// Fetches or load the JSON lint rules.
///
/// If [verifyOnly] is `false`, fetches JSON from [rulesUrl],
/// extracts the needed information, and writes a summary to
/// [rulesCacheFilePath].
///
/// If [verifyOnly] is `true`, only reads the cached data back from
/// [rulesCacheFilePath].
Future<Map<String, Map<String, String>>> _fetchRulesJson(
    {required bool verifyOnly}) async {
  final rulesJsonFile = _packageRelativeFile(rulesCacheFilePath);
  if (verifyOnly) {
    final rulesJsonText = rulesJsonFile.readAsStringSync();
    return _readJson(rulesJsonText);
  }
  final rulesJsonText = (await http.get(Uri.parse(rulesUrl))).body;
  final rulesJson = _readJson(rulesJsonText);

  // Re-save [rulesJsonFile] file.
  var newRulesJson = [...rulesJson.values];
  rulesJsonFile
      .writeAsStringSync(JsonEncoder.withIndent('  ').convert(newRulesJson));

  return rulesJson;
}

/// Extracts relevant information from a list of JSON objects.
///
/// For each JSON object, includes only the relevant (string-typed) properties,
/// then creates a map indexed by the `'name'` property of the objects.
Map<String, Map<String, String>> _readJson(String rulesJsonText) {
  /// Relevant keys in the JSON information about lints.
  const relevantKeys = {'name', 'description', 'fixStatus'};
  final rulesJson = jsonDecode(rulesJsonText) as List<dynamic>;
  return {
    for (Map<String, Object?> rule in rulesJson)
      rule['name'] as String: {
        for (var key in relevantKeys) key: rule[key] as String
      }
  };
}

/// Inserts new Markdown content for both rule sets into [content].
///
/// For both "core" and "recommended" rule sets,
/// replaces the table between the two `<!-- core -->` and the two
/// `<!-- recommended -->` markers with a new table generated from
/// [rulesJson], based on the list of rules in `lib/core.yaml` and
/// `lib/recommended.yaml`.
String _updateMarkdown(
    String content, Map<String, Map<String, String>> rulesJson) {
  for (var ruleSetName in ['core', 'recommended']) {
    var ruleFile = _packageRelativeFile(p.join('lib', '$ruleSetName.yaml'));
    var ruleSet = _parseRules(ruleFile);

    final rangeDelimiter = '<!-- $ruleSetName -->\n';
    var rangeStart = content.indexOf(rangeDelimiter) + rangeDelimiter.length;
    var rangeEnd = content.indexOf(rangeDelimiter, rangeStart);
    if (rangeEnd < 0) {
      stderr.writeln('Missing "$rangeDelimiter" in $rulesMarkdownFilePath.');
      continue;
    }
    content = content.replaceRange(
        rangeStart, rangeEnd, _createRuleTable(ruleSet, rulesJson));
  }
  return content;
}

/// Parses analysis options YAML file, and extracts linter rules.
List<String> _parseRules(File yamlFile) {
  var yamlData = yaml.loadYaml(yamlFile.readAsStringSync()) as Map;
  var linterEntry = yamlData['linter'] as Map;
  return List<String>.from(linterEntry['rules'] as List);
}

/// Creates markdown source for a table of lint rules.
String _createRuleTable(
    List<String> rules, Map<String, Map<String, String>> lintMeta) {
  rules.sort();

  final lines = [
    '| Lint Rules | Description | [Fix][] |',
    '| :--------- | :---------- | ------- |',
    for (var rule in rules) _createRuleTableRow(rule, lintMeta),
  ];

  return '${lines.join('\n')}\n';
}

/// Creates a line containing the markdown table row for a single lint rule.
///
/// Used by [_createRuleTable] for each row in the generated table.
/// The row should have the same number of entires as the table format,
/// and should be on a single line with no newline at the end.
String _createRuleTableRow(
    String rule, Map<String, Map<String, String>> lintMeta) {
  final ruleMeta = lintMeta[rule];
  if (ruleMeta == null) {
    stderr.writeln("WARNING: Missing rule information for rule: $rule");
  }
  final description = (ruleMeta?['description'] ?? '')
      .replaceAll('\n', ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
  final hasFix = ruleMeta?['fixStatus'] == 'hasFix';
  final fixDesc = hasFix ? '✅' : '';

  return '| [`$rule`](https://dart.dev/lints/$rule) | '
      '$description | $fixDesc |';
}

/// A path relative to the root of this package.
///
/// Works independently of the current working directory.
/// Is based on the location of this script, through [Platform.script].
File _packageRelativeFile(String packagePath) =>
    File(p.join(_packageRoot, packagePath));

/// Cached package root used by [_packageRelative].
final String _packageRoot = _relativePackageRoot();

/// A path to the package root from the current directory.
///
/// If the current directory is inside the package, the returned path is
/// a relative path of a number of `..` segments.
/// If the current directory is outside of the package, the returned path
/// may be absolute.
String _relativePackageRoot() {
  var rootPath = p.dirname(p.dirname(Platform.script.path));
  if (p.isRelative(rootPath)) return rootPath;
  var baseDir = p.current;
  if (rootPath == baseDir) return '';
  if (baseDir.startsWith(rootPath)) {
    var backSteps = <String>[];
    do {
      backSteps.add('..');
      baseDir = p.dirname(baseDir);
    } while (baseDir != rootPath);
    return p.joinAll(backSteps);
  }
  return rootPath;
}
