import 'package:formz/formz.dart';

enum TestDescriptionInputError { empty, length }

class TestDescription extends FormzInput<String, TestDescriptionInputError> {
  const TestDescription.pure() : super.pure('');

  const TestDescription.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == TestDescriptionInputError.empty) {
      return 'the field is required';
    }
    if (displayError == TestDescriptionInputError.length) {
      return 'min 6 characters';
    }
    return null;
  }

  @override
  TestDescriptionInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty)
      return TestDescriptionInputError.empty;
    if (value.length < 6) return TestDescriptionInputError.length;

    return null;
  }
}
