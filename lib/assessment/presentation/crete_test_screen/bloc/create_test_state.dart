part of 'create_test_bloc.dart';

class CreateTestState extends Equatable {
  final bool isValidGeneralInformation;
  final TestTitle title;
  final TestDescription description;
  final TestQuestion question;
  final bool isValidQuestion;

  const CreateTestState({
    this.isValidQuestion = false,
    this.question = const TestQuestion.pure(),
    this.isValidGeneralInformation = false,
    this.title = const TestTitle.pure(),
    this.description = const TestDescription.pure(),
  });

  CreateTestState copyWith({
    bool? isValidQuestion,
    bool? isValidGeneralInformation,
    TestTitle? title,
    TestDescription? description,
    TestQuestion? question,
  }) =>
      CreateTestState(
          isValidQuestion: isValidQuestion ?? this.isValidQuestion,
          isValidGeneralInformation:
              isValidGeneralInformation ?? this.isValidGeneralInformation,
          title: title ?? this.title,
          description: description ?? this.description,
          question: question ?? this.question);

  @override
  List<Object> get props => [
        isValidGeneralInformation,
        isValidQuestion,
        description,
        question,
      ];
}
