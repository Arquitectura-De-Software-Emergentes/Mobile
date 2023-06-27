part of 'questions_list_bloc.dart';

enum QuestionsListStatus { initial, loading, success, error }

class QuestionsListState extends Equatable {
  const QuestionsListState({
    this.questions = const <Question>[],
    this.status = QuestionsListStatus.initial,
    this.errorMessage = '',
  });
  final List<Question> questions;
  final QuestionsListStatus status;
  final String errorMessage;

  QuestionsListState copyWith({
    List<Question>? questions,
    QuestionsListStatus? status,
    String? errorMessage,
  }) {
    return QuestionsListState(
      questions: questions ?? this.questions,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [questions, status, errorMessage];
}
