## 2.1.1-dev

- Added the `analysis` and `lints` topics to the pubspec file.

## 2.1.0

- Updated SDK lower-bound to 3.0
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
