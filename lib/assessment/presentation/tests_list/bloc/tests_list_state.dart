part of 'tests_list_bloc.dart';

enum TestsListStatus { initial, loading, success, error }

class TestsListState extends Equatable {
  const TestsListState({
    this.tests = const <Test>[],
    this.status = TestsListStatus.initial,
    this.errorMessage = '',
  });

  final List<Test> tests;
  final TestsListStatus status;
  final String errorMessage;

  TestsListState copyWith({
    List<Test>? tests,
    TestsListStatus? status,
    String? errorMessage,
  }) {
    return TestsListState(
      status: status ?? this.status,
      tests: tests ?? this.tests,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        status,
        tests,
        errorMessage,
      ];
}
