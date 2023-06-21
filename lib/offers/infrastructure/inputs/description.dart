import 'package:formz/formz.dart';

enum DescriptionInputError { empty, length }

class Description extends FormzInput<String, DescriptionInputError> {
  const Description.pure() : super.pure('');

  const Description.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == DescriptionInputError.empty) {
      return 'the field is required';
    }
    if (displayError == DescriptionInputError.length) {
      return 'min 10 characters';
    }

    return null;
  }

  @override
  DescriptionInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return DescriptionInputError.empty;
    }
    if (value.length < 10) return DescriptionInputError.length;

    return null;
  }
}
