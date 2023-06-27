import 'package:formz/formz.dart';

enum AlternativeBInputError { empty, length }

class AlternativeB extends FormzInput<String, AlternativeBInputError> {
  const AlternativeB.pure() : super.pure('');

  const AlternativeB.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == AlternativeBInputError.empty) {
      return 'the field is required';
    }
    if (displayError == AlternativeBInputError.length) {
      return 'min 2 characters';
    }
    return null;
  }

  @override
  AlternativeBInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty)
      return AlternativeBInputError.empty;
    if (value.length < 2) return AlternativeBInputError.length;

    return null;
  }
}
