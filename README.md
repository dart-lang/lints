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
For more information about topics, see
[dart.dev/tools/pub/pubspec#topics](https://dart.dev/tools/pub/pubspec#topics).

## Where these lints are used

When creating new Dart project using the [`dart create`][dart create] command,
the lints from `package:lints` are enabled by default.

When uploading a package to the [pub.dev] package repository, packages are
[awarded pub points][scoring] based on how many of the 'core' lints pass.

## Enabling the lints

For new apps created with `dart create` the `recommended` set of lints are enabled
by default.

For existing apps or packages, you can enable these lints via:

1.  In a terminal, located at the root of your package, run this command:

    ```terminal
    dart pub add --dev lints
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

## Customizing the predefined lint sets

For details on customizing static analysis above and beyond the predefined
lint sets, see [customizing static analysis].

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

### Core lints

To use these lints create an `analysis_options.yaml` file with:
`include: package:lints/core.yaml`.

<!-- core -->
| Lint Rules | Description |
| :--------- | :---------- |
| [`avoid_empty_else`](https://dart.dev/lints/avoid_empty_else) | Avoid empty else statements. |
| [`avoid_relative_lib_imports`](https://dart.dev/lints/avoid_relative_lib_imports) | Avoid relative imports for files in `lib/`. |
| [`avoid_shadowing_type_parameters`](https://dart.dev/lints/avoid_shadowing_type_parameters) | Avoid shadowing type parameters. |
| [`avoid_types_as_parameter_names`](https://dart.dev/lints/avoid_types_as_parameter_names) | Avoid types as parameter names. |
| [`await_only_futures`](https://dart.dev/lints/await_only_futures) | Await only futures. |
| [`camel_case_extensions`](https://dart.dev/lints/camel_case_extensions) | Name extensions using UpperCamelCase. |
| [`camel_case_types`](https://dart.dev/lints/camel_case_types) | Name types using UpperCamelCase. |
| [`collection_methods_unrelated_type`](https://dart.dev/lints/collection_methods_unrelated_type) | Invocation of various collection methods with arguments of unrelated types. |
| [`curly_braces_in_flow_control_structures`](https://dart.dev/lints/curly_braces_in_flow_control_structures) | DO use curly braces for all flow control structures. |
| [`depend_on_referenced_packages`](https://dart.dev/lints/depend_on_referenced_packages) | Depend on referenced packages. |
| [`empty_catches`](https://dart.dev/lints/empty_catches) | Avoid empty catch blocks. |
| [`file_names`](https://dart.dev/lints/file_names) | Name source files using `lowercase_with_underscores`. |
| [`hash_and_equals`](https://dart.dev/lints/hash_and_equals) | Always override `hashCode` if overriding `==`. |
| [`no_duplicate_case_values`](https://dart.dev/lints/no_duplicate_case_values) | Don't use more than one case with same value. |
| [`non_constant_identifier_names`](https://dart.dev/lints/non_constant_identifier_names) | Name non-constant identifiers using lowerCamelCase. |
| [`null_check_on_nullable_type_parameter`](https://dart.dev/lints/null_check_on_nullable_type_parameter) | Don't use null check on a potentially nullable type parameter. |
| [`package_prefixed_library_names`](https://dart.dev/lints/package_prefixed_library_names) | Prefix library names with the package name and a dot-separated path. |
| [`prefer_generic_function_type_aliases`](https://dart.dev/lints/prefer_generic_function_type_aliases) | Prefer generic function type aliases. |
| [`prefer_is_empty`](https://dart.dev/lints/prefer_is_empty) | Use `isEmpty` for Iterables and Maps. |
| [`prefer_is_not_empty`](https://dart.dev/lints/prefer_is_not_empty) | Use `isNotEmpty` for Iterables and Maps. |
| [`prefer_iterable_whereType`](https://dart.dev/lints/prefer_iterable_whereType) | Prefer to use whereType on iterable. |
| [`prefer_typing_uninitialized_variables`](https://dart.dev/lints/prefer_typing_uninitialized_variables) | Prefer typing uninitialized variables and fields. |
| [`provide_deprecation_message`](https://dart.dev/lints/provide_deprecation_message) | Provide a deprecation message, via @Deprecated("message"). |
| [`unnecessary_overrides`](https://dart.dev/lints/unnecessary_overrides) | Don't override a method to do a super method invocation with the same parameters. |
| [`unrelated_type_equality_checks`](https://dart.dev/lints/unrelated_type_equality_checks) | Equality operator `==` invocation with references of unrelated types. |
| [`valid_regexps`](https://dart.dev/lints/valid_regexps) | Use valid regular expression syntax. |
| [`void_checks`](https://dart.dev/lints/void_checks) | Don't assign to void. |
<!-- core -->

### Recommended lints

To use these lints create an `analysis_options.yaml` file with:
`include: package:lints/recommended.yaml`.

<!-- recommended -->
| Lint Rules | Description |
| :--------- | :---------- |
| [`annotate_overrides`](https://dart.dev/lints/annotate_overrides) | Annotate overridden members. |
| [`avoid_function_literals_in_foreach_calls`](https://dart.dev/lints/avoid_function_literals_in_foreach_calls) | Avoid using `forEach` with a function literal. |
| [`avoid_init_to_null`](https://dart.dev/lints/avoid_init_to_null) | Don't explicitly initialize variables to null. |
| [`avoid_null_checks_in_equality_operators`](https://dart.dev/lints/avoid_null_checks_in_equality_operators) | Don't check for null in custom == operators. |
| [`avoid_renaming_method_parameters`](https://dart.dev/lints/avoid_renaming_method_parameters) | Don't rename parameters of overridden methods. |
| [`avoid_return_types_on_setters`](https://dart.dev/lints/avoid_return_types_on_setters) | Avoid return types on setters. |
| [`avoid_returning_null_for_void`](https://dart.dev/lints/avoid_returning_null_for_void) | Avoid returning null for void. |
| [`avoid_single_cascade_in_expression_statements`](https://dart.dev/lints/avoid_single_cascade_in_expression_statements) | Avoid single cascade in expression statements. |
| [`constant_identifier_names`](https://dart.dev/lints/constant_identifier_names) | Prefer using lowerCamelCase for constant names. |
| [`control_flow_in_finally`](https://dart.dev/lints/control_flow_in_finally) | Avoid control flow in finally blocks. |
| [`empty_constructor_bodies`](https://dart.dev/lints/empty_constructor_bodies) | Use `;` instead of `{}` for empty constructor bodies. |
| [`empty_statements`](https://dart.dev/lints/empty_statements) | Avoid empty statements. |
| [`exhaustive_cases`](https://dart.dev/lints/exhaustive_cases) | Define case clauses for all constants in enum-like classes. |
| [`implementation_imports`](https://dart.dev/lints/implementation_imports) | Don't import implementation files from another package. |
| [`library_names`](https://dart.dev/lints/library_names) | Name libraries using `lowercase_with_underscores`. |
| [`library_prefixes`](https://dart.dev/lints/library_prefixes) | Use `lowercase_with_underscores` when specifying a library prefix. |
| [`library_private_types_in_public_api`](https://dart.dev/lints/library_private_types_in_public_api) | Avoid using private types in public APIs. |
| [`no_leading_underscores_for_library_prefixes`](https://dart.dev/lints/no_leading_underscores_for_library_prefixes) | Avoid leading underscores for library prefixes. |
| [`no_leading_underscores_for_local_identifiers`](https://dart.dev/lints/no_leading_underscores_for_local_identifiers) | Avoid leading underscores for local identifiers. |
| [`null_closures`](https://dart.dev/lints/null_closures) | Do not pass `null` as an argument where a closure is expected. |
| [`overridden_fields`](https://dart.dev/lints/overridden_fields) | Don't override fields. |
| [`package_names`](https://dart.dev/lints/package_names) | Use `lowercase_with_underscores` for package names. |
| [`prefer_adjacent_string_concatenation`](https://dart.dev/lints/prefer_adjacent_string_concatenation) | Use adjacent strings to concatenate string literals. |
| [`prefer_collection_literals`](https://dart.dev/lints/prefer_collection_literals) | Use collection literals when possible. |
| [`prefer_conditional_assignment`](https://dart.dev/lints/prefer_conditional_assignment) | Prefer using `??=` over testing for null. |
| [`prefer_contains`](https://dart.dev/lints/prefer_contains) | Use contains for `List` and `String` instances. |
| [`prefer_equal_for_default_values`](https://dart.dev/lints/prefer_equal_for_default_values) | Use `=` to separate a named parameter from its default value. |
| [`prefer_final_fields`](https://dart.dev/lints/prefer_final_fields) | Private field could be final. |
| [`prefer_for_elements_to_map_fromIterable`](https://dart.dev/lints/prefer_for_elements_to_map_fromIterable) | Prefer 'for' elements when building maps from iterables. |
| [`prefer_function_declarations_over_variables`](https://dart.dev/lints/prefer_function_declarations_over_variables) | Use a function declaration to bind a function to a name. |
| [`prefer_if_null_operators`](https://dart.dev/lints/prefer_if_null_operators) | Prefer using if null operators. |
| [`prefer_initializing_formals`](https://dart.dev/lints/prefer_initializing_formals) | Use initializing formals when possible. |
| [`prefer_inlined_adds`](https://dart.dev/lints/prefer_inlined_adds) | Inline list item declarations where possible. |
| [`prefer_interpolation_to_compose_strings`](https://dart.dev/lints/prefer_interpolation_to_compose_strings) | Use interpolation to compose strings and values. |
| [`prefer_is_not_operator`](https://dart.dev/lints/prefer_is_not_operator) | Prefer is! operator. |
| [`prefer_null_aware_operators`](https://dart.dev/lints/prefer_null_aware_operators) | Prefer using null aware operators. |
| [`prefer_spread_collections`](https://dart.dev/lints/prefer_spread_collections) | Use spread collections when possible. |
| [`prefer_void_to_null`](https://dart.dev/lints/prefer_void_to_null) | Don't use the Null type, unless you are positive that you don't want void. |
| [`recursive_getters`](https://dart.dev/lints/recursive_getters) | Property getter recursively returns itself. |
| [`slash_for_doc_comments`](https://dart.dev/lints/slash_for_doc_comments) | Prefer using /// for doc comments. |
| [`type_init_formals`](https://dart.dev/lints/type_init_formals) | Don't type annotate initializing formals. |
| [`unnecessary_brace_in_string_interps`](https://dart.dev/lints/unnecessary_brace_in_string_interps) | Avoid using braces in interpolation when not needed. |
| [`unnecessary_const`](https://dart.dev/lints/unnecessary_const) | Avoid const keyword. |
| [`unnecessary_constructor_name`](https://dart.dev/lints/unnecessary_constructor_name) | Unnecessary `.new` constructor name. |
| [`unnecessary_getters_setters`](https://dart.dev/lints/unnecessary_getters_setters) | Avoid wrapping fields in getters and setters just to be "safe". |
| [`unnecessary_late`](https://dart.dev/lints/unnecessary_late) | Don't specify the `late` modifier when it is not needed. |
| [`unnecessary_new`](https://dart.dev/lints/unnecessary_new) | Unnecessary new keyword. |
| [`unnecessary_null_aware_assignments`](https://dart.dev/lints/unnecessary_null_aware_assignments) | Avoid null in null-aware assignment. |
| [`unnecessary_null_in_if_null_operators`](https://dart.dev/lints/unnecessary_null_in_if_null_operators) | Avoid using `null` in `if null` operators. |
| [`unnecessary_nullable_for_final_variable_declarations`](https://dart.dev/lints/unnecessary_nullable_for_final_variable_declarations) | Use a non-nullable type for a final variable initialized with a non-nullable value. |
| [`unnecessary_string_escapes`](https://dart.dev/lints/unnecessary_string_escapes) | Remove unnecessary backslashes in strings. |
| [`unnecessary_string_interpolations`](https://dart.dev/lints/unnecessary_string_interpolations) | Unnecessary string interpolation. |
| [`unnecessary_this`](https://dart.dev/lints/unnecessary_this) | Don't access members with `this` unless avoiding shadowing. |
| [`use_function_type_syntax_for_parameters`](https://dart.dev/lints/use_function_type_syntax_for_parameters) | Use generic function type syntax for parameters. |
| [`use_rethrow_when_possible`](https://dart.dev/lints/use_rethrow_when_possible) | Use rethrow to rethrow a caught exception. |
<!-- recommended -->

[dart create]: https://dart.dev/tools/dart-tool
[scoring]: https://pub.dev/help/scoring
[customizing static analysis]: https://dart.dev/guides/language/analysis-options
[rules]: https://dart.dev/tools/linter-rules
[pub.dev]: https://pub.dev
[issue]: https://github.com/dart-lang/lints/issues
[linter repo]: https://github.com/dart-lang/linter
[`package:pedantic`]: https://pub.dev/packages/pedantic
[`package:flutter_lints`]: https://pub.dev/packages/flutter_lints
