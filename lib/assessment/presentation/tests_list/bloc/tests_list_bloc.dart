import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:teacher_finder/assessment/infrastructure/repositories/assessment_repository.dart';
import 'package:teacher_finder/common/user_config/user_config.dart';

import '../../../domain/entities/test.dart';

part 'tests_list_event.dart';
part 'tests_list_state.dart';

class TestsListBloc extends Bloc<TestsListEvent, TestsListState> {
  final AssessmentRepository assessmentRepository;
  TestsListBloc()
      : assessmentRepository = GetIt.instance<AssessmentRepository>(),
        super(const TestsListState()) {
    on<LoadAllTests>(_onGetAllTests);
    on<AddTest>(_onAddTest);
  }

  void _onGetAllTests(LoadAllTests event, Emitter<TestsListState> emit) async {
    emit(state.copyWith(
      status: TestsListStatus.loading,
    ));
    int recruiterId = await UserConfig.getUserId();
    try {
      final tests =
          await assessmentRepository.getAllTestsByRecruiterId(recruiterId);
      return emit(state.copyWith(
        status: TestsListStatus.success,
        tests: tests,
      ));
    } catch (error) {
      emit(state.copyWith(
        status: TestsListStatus.error,
        errorMessage: error.toString(),
      ));
    }
  }

  void _onAddTest(AddTest event, Emitter<TestsListState> emit) async {
    try {
      emit(state.copyWith(
        status: TestsListStatus.loading,
        tests: state.tests,
      ));
      final List<Test> currentList = state.tests;
      final List<Test> updatedList = List<Test>.from(currentList);
      final Test response = await assessmentRepository.createTest(event.test);
      updatedList.add(response);
      emit(state.copyWith(status: TestsListStatus.success, tests: updatedList));
    } catch (error) {
      emit(state.copyWith(
        status: TestsListStatus.error,
        errorMessage: error.toString(),
      ));
    }
  }

  void addTest(Test test) {
    add(AddTest(test));
  }

  void getAllTests() {
    add(LoadAllTests());
  }
}
