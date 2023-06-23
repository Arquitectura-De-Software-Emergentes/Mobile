part of 'questions_list_bloc.dart';

abstract class QuestionsListEvent extends Equatable {
  const QuestionsListEvent();

  @override
  List<Object> get props => [];
}

class LoadAllQuestions extends QuestionsListEvent {}

class AddQuestion extends QuestionsListEvent {
  final Question question;
  const AddQuestion(this.question);
}

class DeleteQuestion extends QuestionsListEvent {
  final Question question;

  const DeleteQuestion(this.question);
}
