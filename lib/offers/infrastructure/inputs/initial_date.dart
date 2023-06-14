import 'package:formz/formz.dart';

enum InitialDateInputError { empty }

class InitialDate extends FormzInput<String, InitialDateInputError> {
  const InitialDate.pure() : super.pure('');

  const InitialDate.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == InitialDateInputError.empty) {
      return 'the field is required';
    }

    return null;
  }

  @override
  InitialDateInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return InitialDateInputError.empty;
    }

    return null;
  }
}
