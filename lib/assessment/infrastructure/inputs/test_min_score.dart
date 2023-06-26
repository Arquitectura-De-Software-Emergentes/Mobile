import 'package:formz/formz.dart';

enum TestMinScoreInputError { empty, length, format }

class TestMinScore extends FormzInput<String, TestMinScoreInputError> {
  const TestMinScore.pure() : super.pure('');

  const TestMinScore.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == TestMinScoreInputError.empty) {
      return 'the field is required';
    }
    if (displayError == TestMinScoreInputError.length) {
      return 'max 6 characters';
    }
    if (displayError == TestMinScoreInputError.format) {
      return 'only numbers';
    }
    return null;
  }

  @override
  TestMinScoreInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return TestMinScoreInputError.empty;
    }
    if (value.length > 7) return TestMinScoreInputError.length;
    if (!isNumeric(value)) return TestMinScoreInputError.format;

    return null;
  }

  bool isNumeric(String value) {
    return double.tryParse(value) != null;
  }
}
