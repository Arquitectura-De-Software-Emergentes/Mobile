import 'package:formz/formz.dart';

enum ApplicationsInputError { empty, length, format }

class Applications extends FormzInput<String, ApplicationsInputError> {
  const Applications.pure() : super.pure('');

  const Applications.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == ApplicationsInputError.empty) {
      return 'the field is required';
    }
    if (displayError == ApplicationsInputError.length) {
      return 'max 6 characters';
    }
    if (displayError == ApplicationsInputError.format) {
      return 'only numbers';
    }
    return null;
  }

  @override
  ApplicationsInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return ApplicationsInputError.empty;
    }
    if (value.length > 6) return ApplicationsInputError.length;
    if (!isNumeric(value)) return ApplicationsInputError.format;

    return null;
  }

  bool isNumeric(String value) {
    return double.tryParse(value) != null;
  }
}
