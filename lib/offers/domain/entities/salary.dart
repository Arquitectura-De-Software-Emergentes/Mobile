import 'package:teacher_finder/offers/domain/entities/enums/currency.dart';

class Salary {
  final double mount;
  final Currency currency;

  Salary({
    required this.mount,
    required this.currency,
  });
}
