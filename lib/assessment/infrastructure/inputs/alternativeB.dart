import 'package:formz/formz.dart';

enum AlternativeBInputError { empty }

class AlternativeB extends FormzInput<String, AlternativeBInputError> {
  const AlternativeB.pure() : super.pure('');

  const AlternativeB.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == AlternativeBInputError.empty) {
      return 'the field is required';
    }

    return null;
  }

  @override
  AlternativeBInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return AlternativeBInputError.empty;
    }

    return null;
  }
}
