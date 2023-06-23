import '../../domain/entities/option.dart';

class OptionModel extends Option {
  OptionModel({
    required int id,
    required String response,
    required bool isCorrect,
  }) : super(
          id: id,
          response: response,
          isCorrect: isCorrect,
        );
}
