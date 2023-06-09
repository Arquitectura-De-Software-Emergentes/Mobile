import 'package:teacher_finder/offers/domain/entities/enums/currency.dart';
import 'package:teacher_finder/offers/domain/entities/salary.dart';

class SalaryModel extends Salary {
  SalaryModel({required int mount, required Currency currency})
      : super(mount: mount, currency: currency);

  factory SalaryModel.fromJson(Map<String, dynamic> json) {
    return SalaryModel(
      mount: json['mount'],
      currency: Currency.parseModality(json['currency']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mount': mount,
      'currency': currency.value,
    };
  }
}
