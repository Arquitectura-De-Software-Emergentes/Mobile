part of 'create_test_bloc.dart';

class CreateTestState extends Equatable {
  final bool isValidGeneralInformation;
  final TestTitle title;
  final TestQuestion testQuestion;
  final bool isValidQuestion;
  final bool isCorrect;
  final TestMinScore minScore;

  const CreateTestState({
    this.minScore = const TestMinScore.pure(),
    this.isCorrect = false,
    this.isValidQuestion = false,
    this.testQuestion = const TestQuestion.pure(),
    this.isValidGeneralInformation = false,
    this.title = const TestTitle.pure(),
  });

  CreateTestState copyWith({
    bool? isValidQuestion,
    bool? isValidGeneralInformation,
    TestTitle? title,
    TestQuestion? testQuestion,
    List<Question>? questions,
    TestMinScore? minScore,
  }) =>
      CreateTestState(
          isValidQuestion: isValidQuestion ?? this.isValidQuestion,
          isValidGeneralInformation:
              isValidGeneralInformation ?? this.isValidGeneralInformation,
          title: title ?? this.title,
          testQuestion: testQuestion ?? this.testQuestion,
          minScore: minScore ?? this.minScore);

  @override
  List<Object> get props => [
        isValidGeneralInformation,
        isValidQuestion,
        testQuestion,
        title,
        minScore,
      ];
}
