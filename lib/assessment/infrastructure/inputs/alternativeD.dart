import 'package:formz/formz.dart';

enum AlternativeDInputError { empty, length }

class AlternativeD extends FormzInput<String, AlternativeDInputError> {
  const AlternativeD.pure() : super.pure('');

  const AlternativeD.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == AlternativeDInputError.empty) {
      return 'the field is required';
    }
    if (displayError == AlternativeDInputError.length) {
      return 'min 2 characters';
    }
    return null;
  }

  @override
  AlternativeDInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty)
      return AlternativeDInputError.empty;
    if (value.length < 2) return AlternativeDInputError.length;

    return null;
  }
}
