import 'package:formz/formz.dart';

enum TitleInputError { empty, length }

class Title extends FormzInput<String, TitleInputError> {
  const Title.pure() : super.pure('');

  const Title.dirty(String value) : super.dirty(value);

  @override
  TitleInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return TitleInputError.empty;
    if (value.length < 6) return TitleInputError.length;

    return null;
  }
}
