part of 'create_test_bloc.dart';

abstract class CreateTestEvent extends Equatable {
  const CreateTestEvent();

  @override
  List<Object> get props => [];
}

class TestTitleChanged extends CreateTestEvent {
  final String title;

  const TestTitleChanged(this.title);
}

class TestDescriptionChanged extends CreateTestEvent {
  final String description;

  const TestDescriptionChanged(this.description);
}

class TestQuestionChanged extends CreateTestEvent {
  final String question;

  const TestQuestionChanged(this.question);
}
