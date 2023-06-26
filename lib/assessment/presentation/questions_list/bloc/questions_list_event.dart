part of 'questions_list_bloc.dart';

abstract class QuestionsListEvent extends Equatable {
  const QuestionsListEvent();

  @override
  List<Object> get props => [];
}

class LoadAllQuestions extends QuestionsListEvent {
  final int testId;
  const LoadAllQuestions(this.testId);
}

class AddQuestion extends QuestionsListEvent {
  final Question question;
  final int testId;
  const AddQuestion(this.question, this.testId);
}

class DeleteQuestion extends QuestionsListEvent {
  final Question question;

  const DeleteQuestion(this.question);
}
