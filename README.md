[![Build Status](https://github.com/dart-lang/lints/workflows/validate/badge.svg)](https://github.com/dart-lang/lints/actions?query=branch%3Amain)
[![pub package](https://img.shields.io/pub/v/lints.svg)](https://pub.dev/packages/lints)
[![package publisher](https://img.shields.io/pub/publisher/lints.svg)](https://pub.dev/packages/lints/publisher)

# Official Dart lint rules

The Dart linter is a static analyzer for identifying possible problems in your
Dart source code. More than a hundred [linter rules][rules] are available,
checking anything from potential typing issues, coding style, and formatting.
This package - `package:lints` - contains the lint settings recommended by the
Dart team.

## Lint sets

This package includes two sets of lints:

* **Core lints**: Lints that help identify critical issues that are likely to
lead to problems when running or consuming Dart code. All code should pass these
lints.

* **Recommended lints**: Lints that help identify additional issues that may
lead to problems when running or consuming Dart code, and lints that enforce
writing Dart using a single, idiomatic style and format. All code is encouraged
to pass these lints. The recommended lints include all the core lints.

Additionally, a third lint set -
[`package:flutter_lints`](https://pub.dev/packages/flutter_lints) - extends the
recommended set with additional recommended Flutter-specific lints.

The Dart team will likely not provide recommendations past the `core` and
`recommended` sets (e.g., a `strict` rule set). However, there are many such rule
sets in the ecosystem (available at [pub.dev](https://pub.dev/)).

Rule set authors: consider adding the `lints` topic to your pubspec to allow
easier discovery (e.g.,
[pub.dev/packages?q=topic:lints](https://pub.dev/packages?q=topic%3Alints)).
For more information about topics, visit
[dart.dev/tools/pub/pubspec#topics](https://dart.dev/tools/pub/pubspec#topics).

## Where these lints are used

When creating new Dart project using the [`dart create`][dart create] command,
the `recommended` set of lints from `package:lints` is enabled by default.

When uploading a package to the [pub.dev] package repository, packages are
[awarded pub points][scoring] based on how many of the 'core' lints pass.

## Enabling the lints

For new apps created with `dart create` the `recommended` set of lints are
enabled by default.

For existing apps or packages, you can enable these lints via:

1.  In a terminal, located at the root of your package, run this command:

    ```terminal
    dart pub add dev:lints
    ```

2.  Create a new `analysis_options.yaml` file, next to the pubspec, that
    includes the lints package:

    ```yaml
    include: package:lints/recommended.yaml
    ```

    or:

    ```yaml
    include: package:lints/core.yaml
    ```

## Upgrading to the latest lints

To upgrade to the latest version of the lint set, run:

```
dart pub add dev:lints
```

## Customizing the predefined lint sets

For details on customizing static analysis above and beyond the predefined
lint sets, check out [Customizing static analysis].

## Evolving the lint sets

The Dart language changes and the ecosystem continues to develop new best 
practices, so the lint sets must be periodically updated to reflect the best way
we know to write Dart code. The process we use is:

1.  Anyone can file an [issue] to discuss a potential change to a lint set
    (i.e., adding or removing a lint from one or both sets; if you're proposing
    an entirely new lint, the place to suggest that is at the [linter repo]).
    Feedback is welcome from any Dart user.

2.  Periodically, a group of Dart and Flutter team members meet to review the
    suggestions and decide what to adopt.

3.  The lists are updated and a new version of the package is published.

## Lint set contents

See [rules.md](https://github.com/dart-lang/lints/blob/main/rules.md) for a list
of rules that make up the core and recommended rule sets.

[dart create]: https://dart.dev/tools/dart-create
[scoring]: https://pub.dev/help/scoring
[customizing static analysis]: https://dart.dev/tools/analysis
[rules]: https://dart.dev/tools/linter-rules
[pub.dev]: https://pub.dev
[issue]: https://github.com/dart-lang/lints/issues
[linter repo]: https://github.com/dart-lang/linter
[`package:flutter_lints`]: https://pub.dev/packages/flutter_lints
