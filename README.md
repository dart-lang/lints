[![pub package](https://img.shields.io/pub/v/lints.svg)](https://pub.dev/packages/lints)
[![Build Status](https://github.com/dart-lang/lints/workflows/validate/badge.svg)](https://github.com/dart-lang/lints/actions?query=branch%3Amain)

# Official Dart lint rules.

The Dart linter is a static analyzer for identifying possible problems in your
Dart source code. More than a hundred [linter rules][rules] are available,
checking anything from potential typing issues, coding style, and formatting.

The current `package:lints` contains the official selections of lints that the
Dart team encourages using.

Two sets of lints are available:

* ***Core lints***: Lints that help identify critical issues that are likely to
lead to problems when running or consuming Dart code. All code should pass these
lints.

* ***Recommended lints***: Lints that help identify additional issues that may
lead to problems when running or consuming Dart code, and lints that enforce
writing Dart using a single, idiomatic style and format. All code is encouraged
to pass these lints. The recommended lints include all the core lints.

## Where these lints are used

When creating new Dart project using the [`dart create`][dart create] command,
the lints from `package:lints` are enabled by default.

When uploading a package to the [pub.dev] package repository, packages are
[awarded pub points][scoring] depending on whether they pass at least the 'core'
lints (note: the recommended lints automatically include all core lints). 

For documentation on the individual lints, see the [linter rules][rules] page on
dart.dev.

## How to enable these lints

For new apps created with `dart create`, the lints are enabled by default.

For existing apps or packages, take these steps to enable these lints:

1. In a terminal, located at the root of your package, run this command:

```terminal
dart pub add --dev lints
```

2. Create a new `analysis_options.yaml` file, next to the pubspec, that includes
the lints package:

```yaml
include: package:lints/recommended.yaml
```

## Customizing the pre-defined lint sets

You can customize the pre-defined lint sets, both to disable one or more of the
lints included, or to add additional lints. For details see [customizing static
analysis].

[dart create]: https://dart.dev/tools/dart-tool
[scoring]: https://pub.dev/help/scoring
[customizing static analysis]: https://dart.dev/guides/language/analysis-options
[rules]: https://dart.dev/tools/linter-rules
[pub.dev]: https://pub.dev
