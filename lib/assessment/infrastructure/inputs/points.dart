import 'package:formz/formz.dart';

enum PointsInputError { empty, length, format }

class Points extends FormzInput<String, PointsInputError> {
  const Points.pure() : super.pure('');

  const Points.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PointsInputError.empty) {
      return 'the field is required';
    }
    if (displayError == PointsInputError.length) {
      return 'min 2 characters';
    }
    if (displayError == PointsInputError.format) {
      return 'only numbers';
    }
    return null;
  }

  @override
  PointsInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return PointsInputError.empty;
    }
    if (value.length > 7) return PointsInputError.length;
    if (!isNumeric(value)) return PointsInputError.format;

    return null;
  }

  bool isNumeric(String value) {
    return double.tryParse(value) != null;
  }
}
