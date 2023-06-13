import 'package:formz/formz.dart';

enum DescriptionInputError { empty, length }

class Description extends FormzInput<String, DescriptionInputError> {
  const Description.pure() : super.pure('');

  const Description.dirty(String value) : super.dirty(value);

  @override
  DescriptionInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return DescriptionInputError.empty;
    }
    if (value.length < 10) return DescriptionInputError.length;

    return null;
  }
}
