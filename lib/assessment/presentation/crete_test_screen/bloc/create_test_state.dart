part of 'create_test_bloc.dart';

abstract class CreateTestState extends Equatable {
  const CreateTestState();
}

class CreateTestInitial extends CreateTestState {
  @override
  List<Object> get props => [];
}

class GeneralInformation extends CreateTestState {
  final bool isValid;
  final TestTitle title;
  final TestDescription description;

  const GeneralInformation({
    this.isValid = false,
    this.title = const TestTitle.pure(),
    this.description = const TestDescription.pure(),
  });

  GeneralInformation copyWith({
    bool? isValid,
    TestTitle? title,
    TestDescription? description,
  }) =>
      GeneralInformation(
          isValid: isValid ?? this.isValid,
          title: title ?? this.title,
          description: description ?? this.description);

  @override
  List<Object> get props => [
        isValid,
        title,
        description,
      ];
}
