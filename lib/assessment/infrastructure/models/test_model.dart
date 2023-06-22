import '../../domain/entities/test.dart';

class TestModel extends Test {
  TestModel({
    required DateTime initialDate,
    required DateTime endDate,
    required int minScore,
  }) : super(
          minScore: minScore,
          initialDate: initialDate,
          endDate: endDate,
        );
}
