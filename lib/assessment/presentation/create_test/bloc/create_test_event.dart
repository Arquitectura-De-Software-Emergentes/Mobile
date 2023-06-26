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

class TestQuestionChanged extends CreateTestEvent {
  final String testQuestion;

  const TestQuestionChanged(this.testQuestion);
}

class TestMinScoreChanged extends CreateTestEvent {
  final String minScore;

  const TestMinScoreChanged(this.minScore);
}
