// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:path/path.dart' as p;
import 'package:yaml/yaml.dart' as yaml;
import 'package:http/http.dart' as http;

void main(List<String> args) async {
  final justVerify = args.isNotEmpty;
  final lintRules = <String, List<String>>{};

  final rulesJsonFile = File('tool/rules.json');
  final rulesUrl =
      'https://raw.githubusercontent.com/dart-lang/site-www/main/src/_data/linter_rules.json';
  if (!justVerify) {
    rulesJsonFile.writeAsStringSync((await http.get(Uri.parse(rulesUrl))).body);
  }
  final rulesJson = (jsonDecode(rulesJsonFile.readAsStringSync()) as List)
      .cast<Map<String, dynamic>>();

  final rulesMdFile = File('rules.md');
  final rulesMdContent = rulesMdFile.readAsStringSync();

  if (justVerify) {
    print('Validating that ${rulesMdFile.path} is up-to-date ...');
  } else {
    print('Regenerating ${rulesMdFile.path} ...');
  }

  for (var file in ['lib/core.yaml', 'lib/recommended.yaml']) {
    var name = p.basenameWithoutExtension(file);
    lintRules[name] = _parseRules(File(file));
  }

  var newContent = rulesMdContent;

  for (var ruleSetName in lintRules.keys) {
    final comment = '<!-- $ruleSetName -->\n';

    newContent = newContent.replaceRange(
      newContent.indexOf(comment) + comment.length,
      newContent.lastIndexOf(comment),
      _createRuleTable(lintRules[ruleSetName]!, rulesJson),
    );
  }

  if (justVerify) {
    if (newContent != rulesMdContent) {
      print('${rulesMdFile.path} is not up-to-date (lint tables need to be '
          'regenerated).');
      print('');
      print("Run 'dart tool/gen_docs.dart' to re-generate.");
      exit(1);
    } else {
      print('${rulesMdFile.path} is up-to-date.');
    }
  } else {
    // Re-save rules.json.
    const retainKeys = {'name', 'description', 'fixStatus'};
    for (var rule in rulesJson) {
      rule.removeWhere((key, value) => !retainKeys.contains(key));
    }
    rulesJsonFile
        .writeAsStringSync(JsonEncoder.withIndent('  ').convert(rulesJson));

    // Write out the rules md file.
    rulesMdFile.writeAsStringSync(newContent);
    print('Wrote ${rulesMdFile.path}.');
  }
}

List<String> _parseRules(File yamlFile) {
  var yamlData = yaml.loadYaml(yamlFile.readAsStringSync()) as Map;
  return (yamlData['linter']['rules'] as List).toList().cast<String>();
}

String _createRuleTable(
    List<String> rules, List<Map<String, dynamic>> lintMeta) {
  rules.sort();

  final lines = [
    '| Lint Rules | Description | [Fix][] |',
    '| :--------- | :---------- | ------- |',
    ...rules.map((rule) {
      final ruleMeta =
          lintMeta.firstWhereOrNull((meta) => meta['name'] == rule);

      if (ruleMeta == null) {
        print('rules.json data for rule \'$rule\' not found.');
        print('Update lib/rules.json from '
            'https://raw.githubusercontent.com/dart-lang/site-www/main/src/_data/linter_rules.json.');
        exit(1);
      }
      final description = ruleMeta['description'] as String?;
      final hasFix = ruleMeta['fixStatus'] == 'hasFix';
      final fixDesc = hasFix ? '✅' : '';

      return '| [`$rule`](https://dart.dev/lints/$rule) | $description | $fixDesc |';
    }),
  ];

  return '${lines.join('\n')}\n';
}
