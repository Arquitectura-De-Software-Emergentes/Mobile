import 'package:formz/formz.dart';

enum AlternativeDInputError { empty }

class AlternativeD extends FormzInput<String, AlternativeDInputError> {
  const AlternativeD.pure() : super.pure('');

  const AlternativeD.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == AlternativeDInputError.empty) {
      return 'the field is required';
    }

    return null;
  }

  @override
  AlternativeDInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return AlternativeDInputError.empty;
    }

    return null;
  }
}
