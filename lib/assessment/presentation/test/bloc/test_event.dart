part of 'test_bloc.dart';


abstract class TestEvent extends Equatable {
  const TestEvent();

  @override
  List<Object> get props => [];
}

class LoadAllQuestions extends TestEvent {
  final int testId;
  const LoadAllQuestions(this.testId);
}

