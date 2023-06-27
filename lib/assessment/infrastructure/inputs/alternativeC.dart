import 'package:formz/formz.dart';

enum AlternativeCInputError { empty, length }

class AlternativeC extends FormzInput<String, AlternativeCInputError> {
  const AlternativeC.pure() : super.pure('');

  const AlternativeC.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == AlternativeCInputError.empty) {
      return 'the field is required';
    }
    if (displayError == AlternativeCInputError.length) {
      return 'min 2 characters';
    }
    return null;
  }

  @override
  AlternativeCInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty)
      return AlternativeCInputError.empty;
    if (value.length < 2) return AlternativeCInputError.length;

    return null;
  }
}
