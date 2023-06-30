import 'package:formz/formz.dart';

enum AlternativeAInputError { empty }

class AlternativeA extends FormzInput<String, AlternativeAInputError> {
  const AlternativeA.pure() : super.pure('');

  const AlternativeA.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == AlternativeAInputError.empty) {
      return 'the field is required';
    }

    return null;
  }

  @override
  AlternativeAInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return AlternativeAInputError.empty;
    }

    return null;
  }
}
