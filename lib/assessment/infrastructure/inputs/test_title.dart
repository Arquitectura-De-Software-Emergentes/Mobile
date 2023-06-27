import 'package:formz/formz.dart';

enum TestTitleInputError { empty, length }

class TestTitle extends FormzInput<String, TestTitleInputError> {
  const TestTitle.pure() : super.pure('');

  const TestTitle.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == TestTitleInputError.empty) {
      return 'the field is required';
    }
    if (displayError == TestTitleInputError.length) {
      return 'min 6 characters';
    }
    return null;
  }

  @override
  TestTitleInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return TestTitleInputError.empty;
    if (value.length < 6) return TestTitleInputError.length;

    return null;
  }
}
