part of 'create_test_bloc.dart';

class CreateTestState extends Equatable {
  final bool isValidGeneralInformation;
  final TestTitle title;
  final TestDescription description;
  final TestQuestion testQuestion;
  final bool isValidQuestion;
  final bool isCorrect;

  const CreateTestState({
    this.isCorrect = false,
    this.isValidQuestion = false,
    this.testQuestion = const TestQuestion.pure(),
    this.isValidGeneralInformation = false,
    this.title = const TestTitle.pure(),
    this.description = const TestDescription.pure(),
  });

  CreateTestState copyWith({
    bool? isValidQuestion,
    bool? isValidGeneralInformation,
    TestTitle? title,
    TestDescription? description,
    TestQuestion? testQuestion,
    List<Question>? questions,
  }) =>
      CreateTestState(
        isValidQuestion: isValidQuestion ?? this.isValidQuestion,
        isValidGeneralInformation:
            isValidGeneralInformation ?? this.isValidGeneralInformation,
        title: title ?? this.title,
        description: description ?? this.description,
        testQuestion: testQuestion ?? this.testQuestion,
      );

  @override
  List<Object> get props => [
        isValidGeneralInformation,
        isValidQuestion,
        description,
        testQuestion,
        title,
      ];
}
