part of 'tests_list_bloc.dart';

abstract class TestsListEvent extends Equatable {
  const TestsListEvent();

  @override
  List<Object> get props => [];
}

class LoadAllTests extends TestsListEvent {}
