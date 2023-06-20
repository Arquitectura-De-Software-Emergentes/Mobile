import 'package:formz/formz.dart';

enum SalaryAmountInputError { empty, length, format }

class SalaryAmount extends FormzInput<String, SalaryAmountInputError> {
  const SalaryAmount.pure() : super.pure('');

  const SalaryAmount.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == SalaryAmountInputError.empty) {
      return 'the field is required';
    }
    if (displayError == SalaryAmountInputError.length) {
      return 'max 6 characters';
    }
    if (displayError == SalaryAmountInputError.format) {
      return 'only numbers';
    }
    return null;
  }

  @override
  SalaryAmountInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return SalaryAmountInputError.empty;
    }
    if (value.length > 7) return SalaryAmountInputError.length;
    if (!isNumeric(value)) return SalaryAmountInputError.format;

    return null;
  }

  bool isNumeric(String value) {
    return double.tryParse(value) != null;
  }
}
