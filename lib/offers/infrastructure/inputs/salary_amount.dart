import 'package:formz/formz.dart';

enum SalaryAmountInputError { empty, length }

class SalaryAmount extends FormzInput<String, SalaryAmountInputError> {
  const SalaryAmount.pure() : super.pure('');

  const SalaryAmount.dirty(String value) : super.dirty(value);

  @override
  SalaryAmountInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return SalaryAmountInputError.empty;
    }
    if (value.length > 7) return SalaryAmountInputError.length;

    return null;
  }
}
