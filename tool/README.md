
## `tool/validate_lib.dart`

This tool ensures that we don't commit `.dart` source files into the lib/
directory; it's automatically run by the CI. To run manually:

```
dart tool/validate_lib.dart
```

## `tool/gen_docs.dart`

This tool regenerates the lists of core and recommended lints into the package's
README.md file. To use it, run:

```
dart tool/gen_docs.dart
```

It can also validate that the readme file is up-to-date. It's automatically
run by the CI; to run it manually:

```
dart tool/gen_docs.dart --verify
```
