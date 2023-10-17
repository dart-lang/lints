## 3.0.0

- `core`:
  - added `collection_methods_unrelated_type`
  - added `dangling_library_doc_comments`
  - added `implicit_call_tearoffs`
  - added `secure_pubspec_urls`
  - added `type_literal_in_constant_pattern`
  - added `use_string_in_part_of_directives`
  - removed `iterable_contains_unrelated_type`
  - removed `list_remove_unrelated_type`
  - removed `no_wildcard_variable_uses`
- `recommended`:
  - added `unnecessary_to_list_in_spreads`
  - added `use_super_parameters`
  - removed `prefer_equal_for_default_values`
  - removed `prefer_void_to_null`
- Add info about which lints have quick fixes to the package's readme.
- Move the list of lint rules from the readme to a separate
  [rules.md](https://github.com/dart-lang/lints/blob/main/rules.md) file.

## 2.1.1

- Added the `analysis` and `lints` topics to the pubspec file.
- Update the package's readme to include the list of lint rules that
  `package:lints/core.yaml` and `package:lints/recommended.yaml` include.

## 2.1.0

- Updated the SDK lower-bound to 3.0.
- Removed `always_require_non_null_named_parameters` from `recommended.yaml`
  as it is only relevant in Dart pre 2.12 and with Dart 3.0, libraries can
  no longer be opted back that far.

## 2.0.1

- Updated documentation for the `lib/core.yaml` and `lib/recommended.yaml`
  analysis configurations.

## 2.0.0

- Added the following lints to core.yaml:
    - `depend_on_referenced_packages`
    - `null_check_on_nullable_type_parameter`
- Added the following lints to recommended.yaml:
    - `library_private_types_in_public_api`
    - `no_leading_underscores_for_library_prefixes`
    - `no_leading_underscores_for_local_identifiers`
    - `prefer_interpolation_to_compose_strings`
    - `unnecessary_constructor_name`
    - `unnecessary_late`
    - `unnecessary_null_aware_assignments`
    - `unnecessary_nullable_for_final_variable_declarations`
- Bumped the minimum required Dart SDK version to 2.17

## 1.0.1

- Documentation updates

## 1.0.0

- Initial stable version
