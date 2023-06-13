import 'package:formz/formz.dart';

enum ApplicationsInputError { empty, length }

class Applications extends FormzInput<String, ApplicationsInputError> {
  const Applications.pure() : super.pure('');

  const Applications.dirty(String value) : super.dirty(value);

  @override
  ApplicationsInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return ApplicationsInputError.empty;
    }
    if (value.length > 6) return ApplicationsInputError.length;

    return null;
  }
}
