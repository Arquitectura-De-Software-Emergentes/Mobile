import 'package:formz/formz.dart';

enum AlternativeEInputError { empty, length }

class AlternativeE extends FormzInput<String, AlternativeEInputError> {
  const AlternativeE.pure() : super.pure('');

  const AlternativeE.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == AlternativeEInputError.empty) {
      return 'the field is required';
    }
    if (displayError == AlternativeEInputError.length) {
      return 'min 2 characters';
    }
    return null;
  }

  @override
  AlternativeEInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty)
      return AlternativeEInputError.empty;
    if (value.length < 2) return AlternativeEInputError.length;

    return null;
  }
}
