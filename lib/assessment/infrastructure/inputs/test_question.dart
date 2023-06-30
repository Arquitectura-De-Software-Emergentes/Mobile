import 'package:formz/formz.dart';

enum QuestionInputError { empty }

class TestQuestion extends FormzInput<String, QuestionInputError> {
  const TestQuestion.pure() : super.pure('');

  const TestQuestion.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == QuestionInputError.empty) {
      return 'the field is required';
    }

    return null;
  }

  @override
  QuestionInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return QuestionInputError.empty;

    return null;
  }
}
