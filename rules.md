## Lint set contents

### Core lint rules

<!-- core -->
| Lint Rules | Description | [Fix][] |
| :--------- | :---------- | ------- |
| [`avoid_empty_else`](https://dart.dev/lints/avoid_empty_else) | Avoid empty else statements. | ✅ |
| [`avoid_relative_lib_imports`](https://dart.dev/lints/avoid_relative_lib_imports) | Avoid relative imports for files in `lib/`. | ✅ |
| [`avoid_shadowing_type_parameters`](https://dart.dev/lints/avoid_shadowing_type_parameters) | Avoid shadowing type parameters. |  |
| [`avoid_types_as_parameter_names`](https://dart.dev/lints/avoid_types_as_parameter_names) | Avoid types as parameter names. | ✅ |
| [`await_only_futures`](https://dart.dev/lints/await_only_futures) | Await only futures. | ✅ |
| [`camel_case_extensions`](https://dart.dev/lints/camel_case_extensions) | Name extensions using UpperCamelCase. |  |
| [`camel_case_types`](https://dart.dev/lints/camel_case_types) | Name types using UpperCamelCase. |  |
| [`collection_methods_unrelated_type`](https://dart.dev/lints/collection_methods_unrelated_type) | Invocation of various collection methods with arguments of unrelated types. |  |
| [`curly_braces_in_flow_control_structures`](https://dart.dev/lints/curly_braces_in_flow_control_structures) | DO use curly braces for all flow control structures. | ✅ |
| [`dangling_library_doc_comments`](https://dart.dev/lints/dangling_library_doc_comments) | Attach library doc comments to library directives. | ✅ |
| [`depend_on_referenced_packages`](https://dart.dev/lints/depend_on_referenced_packages) | Depend on referenced packages. |  |
| [`empty_catches`](https://dart.dev/lints/empty_catches) | Avoid empty catch blocks. | ✅ |
| [`file_names`](https://dart.dev/lints/file_names) | Name source files using `lowercase_with_underscores`. |  |
| [`hash_and_equals`](https://dart.dev/lints/hash_and_equals) | Always override `hashCode` if overriding `==`. | ✅ |
| [`implicit_call_tearoffs`](https://dart.dev/lints/implicit_call_tearoffs) | Explicitly tear-off `call` methods when using an object as a Function. | ✅ |
| [`no_duplicate_case_values`](https://dart.dev/lints/no_duplicate_case_values) | Don't use more than one case with same value. | ✅ |
| [`non_constant_identifier_names`](https://dart.dev/lints/non_constant_identifier_names) | Name non-constant identifiers using lowerCamelCase. | ✅ |
| [`null_check_on_nullable_type_parameter`](https://dart.dev/lints/null_check_on_nullable_type_parameter) | Don't use null check on a potentially nullable type parameter. | ✅ |
| [`package_prefixed_library_names`](https://dart.dev/lints/package_prefixed_library_names) | Prefix library names with the package name and a dot-separated path. |  |
| [`prefer_generic_function_type_aliases`](https://dart.dev/lints/prefer_generic_function_type_aliases) | Prefer generic function type aliases. | ✅ |
| [`prefer_is_empty`](https://dart.dev/lints/prefer_is_empty) | Use `isEmpty` for Iterables and Maps. | ✅ |
| [`prefer_is_not_empty`](https://dart.dev/lints/prefer_is_not_empty) | Use `isNotEmpty` for Iterables and Maps. | ✅ |
| [`prefer_iterable_whereType`](https://dart.dev/lints/prefer_iterable_whereType) | Prefer to use whereType on iterable. | ✅ |
| [`prefer_typing_uninitialized_variables`](https://dart.dev/lints/prefer_typing_uninitialized_variables) | Prefer typing uninitialized variables and fields. | ✅ |
| [`provide_deprecation_message`](https://dart.dev/lints/provide_deprecation_message) | Provide a deprecation message, via @Deprecated("message"). |  |
| [`secure_pubspec_urls`](https://dart.dev/lints/secure_pubspec_urls) | Use secure urls in `pubspec.yaml`. |  |
| [`type_literal_in_constant_pattern`](https://dart.dev/lints/type_literal_in_constant_pattern) | Don't use constant patterns with type literals. | ✅ |
| [`unnecessary_overrides`](https://dart.dev/lints/unnecessary_overrides) | Don't override a method to do a super method invocation with the same parameters. | ✅ |
| [`unrelated_type_equality_checks`](https://dart.dev/lints/unrelated_type_equality_checks) | Equality operator `==` invocation with references of unrelated types. |  |
| [`use_string_in_part_of_directives`](https://dart.dev/lints/use_string_in_part_of_directives) | Use string in part of directives. | ✅ |
| [`valid_regexps`](https://dart.dev/lints/valid_regexps) | Use valid regular expression syntax. |  |
| [`void_checks`](https://dart.dev/lints/void_checks) | Don't assign to void. |  |
<!-- core -->

### Recommended lint rules

<!-- recommended -->
| Lint Rules | Description | [Fix][] |
| :--------- | :---------- | ------- |
| [`annotate_overrides`](https://dart.dev/lints/annotate_overrides) | Annotate overridden members. | ✅ |
| [`avoid_function_literals_in_foreach_calls`](https://dart.dev/lints/avoid_function_literals_in_foreach_calls) | Avoid using `forEach` with a function literal. | ✅ |
| [`avoid_init_to_null`](https://dart.dev/lints/avoid_init_to_null) | Don't explicitly initialize variables to null. | ✅ |
| [`avoid_null_checks_in_equality_operators`](https://dart.dev/lints/avoid_null_checks_in_equality_operators) | Don't check for null in custom == operators. | ✅ |
| [`avoid_renaming_method_parameters`](https://dart.dev/lints/avoid_renaming_method_parameters) | Don't rename parameters of overridden methods. | ✅ |
| [`avoid_return_types_on_setters`](https://dart.dev/lints/avoid_return_types_on_setters) | Avoid return types on setters. | ✅ |
| [`avoid_returning_null_for_void`](https://dart.dev/lints/avoid_returning_null_for_void) | Avoid returning null for void. | ✅ |
| [`avoid_single_cascade_in_expression_statements`](https://dart.dev/lints/avoid_single_cascade_in_expression_statements) | Avoid single cascade in expression statements. | ✅ |
| [`constant_identifier_names`](https://dart.dev/lints/constant_identifier_names) | Prefer using lowerCamelCase for constant names. | ✅ |
| [`control_flow_in_finally`](https://dart.dev/lints/control_flow_in_finally) | Avoid control flow in finally blocks. |  |
| [`empty_constructor_bodies`](https://dart.dev/lints/empty_constructor_bodies) | Use `;` instead of `{}` for empty constructor bodies. | ✅ |
| [`empty_statements`](https://dart.dev/lints/empty_statements) | Avoid empty statements. | ✅ |
| [`exhaustive_cases`](https://dart.dev/lints/exhaustive_cases) | Define case clauses for all constants in enum-like classes. | ✅ |
| [`implementation_imports`](https://dart.dev/lints/implementation_imports) | Don't import implementation files from another package. |  |
| [`library_names`](https://dart.dev/lints/library_names) | Name libraries using `lowercase_with_underscores`. |  |
| [`library_prefixes`](https://dart.dev/lints/library_prefixes) | Use `lowercase_with_underscores` when specifying a library prefix. |  |
| [`library_private_types_in_public_api`](https://dart.dev/lints/library_private_types_in_public_api) | Avoid using private types in public APIs. |  |
| [`no_leading_underscores_for_library_prefixes`](https://dart.dev/lints/no_leading_underscores_for_library_prefixes) | Avoid leading underscores for library prefixes. | ✅ |
| [`no_leading_underscores_for_local_identifiers`](https://dart.dev/lints/no_leading_underscores_for_local_identifiers) | Avoid leading underscores for local identifiers. | ✅ |
| [`null_closures`](https://dart.dev/lints/null_closures) | Do not pass `null` as an argument where a closure is expected. | ✅ |
| [`overridden_fields`](https://dart.dev/lints/overridden_fields) | Don't override fields. |  |
| [`package_names`](https://dart.dev/lints/package_names) | Use `lowercase_with_underscores` for package names. |  |
| [`prefer_adjacent_string_concatenation`](https://dart.dev/lints/prefer_adjacent_string_concatenation) | Use adjacent strings to concatenate string literals. | ✅ |
| [`prefer_collection_literals`](https://dart.dev/lints/prefer_collection_literals) | Use collection literals when possible. | ✅ |
| [`prefer_conditional_assignment`](https://dart.dev/lints/prefer_conditional_assignment) | Prefer using `??=` over testing for null. | ✅ |
| [`prefer_contains`](https://dart.dev/lints/prefer_contains) | Use contains for `List` and `String` instances. | ✅ |
| [`prefer_final_fields`](https://dart.dev/lints/prefer_final_fields) | Private field could be final. | ✅ |
| [`prefer_for_elements_to_map_fromIterable`](https://dart.dev/lints/prefer_for_elements_to_map_fromIterable) | Prefer 'for' elements when building maps from iterables. | ✅ |
| [`prefer_function_declarations_over_variables`](https://dart.dev/lints/prefer_function_declarations_over_variables) | Use a function declaration to bind a function to a name. | ✅ |
| [`prefer_if_null_operators`](https://dart.dev/lints/prefer_if_null_operators) | Prefer using if null operators. | ✅ |
| [`prefer_initializing_formals`](https://dart.dev/lints/prefer_initializing_formals) | Use initializing formals when possible. | ✅ |
| [`prefer_inlined_adds`](https://dart.dev/lints/prefer_inlined_adds) | Inline list item declarations where possible. | ✅ |
| [`prefer_interpolation_to_compose_strings`](https://dart.dev/lints/prefer_interpolation_to_compose_strings) | Use interpolation to compose strings and values. | ✅ |
| [`prefer_is_not_operator`](https://dart.dev/lints/prefer_is_not_operator) | Prefer is! operator. | ✅ |
| [`prefer_null_aware_operators`](https://dart.dev/lints/prefer_null_aware_operators) | Prefer using null aware operators. | ✅ |
| [`prefer_spread_collections`](https://dart.dev/lints/prefer_spread_collections) | Use spread collections when possible. | ✅ |
| [`recursive_getters`](https://dart.dev/lints/recursive_getters) | Property getter recursively returns itself. |  |
| [`slash_for_doc_comments`](https://dart.dev/lints/slash_for_doc_comments) | Prefer using /// for doc comments. | ✅ |
| [`type_init_formals`](https://dart.dev/lints/type_init_formals) | Don't type annotate initializing formals. | ✅ |
| [`unnecessary_brace_in_string_interps`](https://dart.dev/lints/unnecessary_brace_in_string_interps) | Avoid using braces in interpolation when not needed. | ✅ |
| [`unnecessary_const`](https://dart.dev/lints/unnecessary_const) | Avoid const keyword. | ✅ |
| [`unnecessary_constructor_name`](https://dart.dev/lints/unnecessary_constructor_name) | Unnecessary `.new` constructor name. | ✅ |
| [`unnecessary_getters_setters`](https://dart.dev/lints/unnecessary_getters_setters) | Avoid wrapping fields in getters and setters just to be "safe". | ✅ |
| [`unnecessary_late`](https://dart.dev/lints/unnecessary_late) | Don't specify the `late` modifier when it is not needed. | ✅ |
| [`unnecessary_new`](https://dart.dev/lints/unnecessary_new) | Unnecessary new keyword. | ✅ |
| [`unnecessary_null_aware_assignments`](https://dart.dev/lints/unnecessary_null_aware_assignments) | Avoid null in null-aware assignment. | ✅ |
| [`unnecessary_null_in_if_null_operators`](https://dart.dev/lints/unnecessary_null_in_if_null_operators) | Avoid using `null` in `if null` operators. | ✅ |
| [`unnecessary_nullable_for_final_variable_declarations`](https://dart.dev/lints/unnecessary_nullable_for_final_variable_declarations) | Use a non-nullable type for a final variable initialized with a non-nullable value. | ✅ |
| [`unnecessary_string_escapes`](https://dart.dev/lints/unnecessary_string_escapes) | Remove unnecessary backslashes in strings. | ✅ |
| [`unnecessary_string_interpolations`](https://dart.dev/lints/unnecessary_string_interpolations) | Unnecessary string interpolation. | ✅ |
| [`unnecessary_this`](https://dart.dev/lints/unnecessary_this) | Don't access members with `this` unless avoiding shadowing. | ✅ |
| [`unnecessary_to_list_in_spreads`](https://dart.dev/lints/unnecessary_to_list_in_spreads) | Unnecessary toList() in spreads. | ✅ |
| [`use_function_type_syntax_for_parameters`](https://dart.dev/lints/use_function_type_syntax_for_parameters) | Use generic function type syntax for parameters. | ✅ |
| [`use_rethrow_when_possible`](https://dart.dev/lints/use_rethrow_when_possible) | Use rethrow to rethrow a caught exception. | ✅ |
| [`use_super_parameters`](https://dart.dev/lints/use_super_parameters) | Use super-initializer parameters where possible. | ✅ |
<!-- recommended -->

[Fix]: https://dart.dev/tools/dart-fix
