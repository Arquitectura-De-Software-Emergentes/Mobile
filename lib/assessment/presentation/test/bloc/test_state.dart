part of 'test_bloc.dart';


enum TestStatus { initial, loading, success, error }

class TestState extends Equatable {
  const TestState({
    this.questions = const <Question>[],
    this.status = TestStatus.initial,
    this.errorMessage = '',
  });
  final List<Question> questions;
  final TestStatus status;
  final String errorMessage;

  TestState copyWith({
    List<Question>? questions,
    TestStatus? status,
    String? errorMessage,
  }) {
    return TestState(
      questions: questions ?? this.questions,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [questions, status, errorMessage];
}
