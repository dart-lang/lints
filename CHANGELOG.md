## 3.0.0-wip

- Added to `core.yaml`:
    - `collection_methods_unrelated_type`
    - `implicit_call_tearoffs`
    - `use_string_in_part_of_directives`
- Removed from `core.yaml`:
    - `iterable_contains_unrelated_type`
    - `list_remove_unrelated_type`
- Add info about which lints have quick fixes to the package's readme.

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
