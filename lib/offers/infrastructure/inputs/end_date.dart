import 'package:formz/formz.dart';

enum EndDateInputError { empty }

class EndDate extends FormzInput<String, EndDateInputError> {
  const EndDate.pure() : super.pure('');

  const EndDate.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == EndDateInputError.empty) {
      return 'the field is required';
    }

    return null;
  }

  @override
  EndDateInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return EndDateInputError.empty;
    }

    return null;
  }
}
