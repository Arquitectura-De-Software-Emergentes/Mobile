import 'package:formz/formz.dart';

enum TitleInputError { empty, length }

class Title extends FormzInput<String, TitleInputError> {
  const Title.pure() : super.pure('');

  const Title.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == TitleInputError.empty) {
      return 'the field is required';
    }
    if (displayError == TitleInputError.length) {
      return 'min 6 characters';
    }
    return null;
  }

  @override
  TitleInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return TitleInputError.empty;
    if (value.length < 6) return TitleInputError.length;

    return null;
  }
}
