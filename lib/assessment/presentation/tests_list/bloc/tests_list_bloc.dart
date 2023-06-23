import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:teacher_finder/assessment/infrastructure/repositories/assessment_repository.dart';

import '../../../domain/entities/test.dart';

part 'tests_list_event.dart';
part 'tests_list_state.dart';

class TestsListBloc extends Bloc<TestsListEvent, TestsListState> {
  final AssessmentRepository assessmentRepository;
  TestsListBloc()
      : assessmentRepository = GetIt.instance<AssessmentRepository>(),
        super(const TestsListState()) {
    on<LoadAllTests>(_onGetAllTests);
  }

  void _onGetAllTests(LoadAllTests event, Emitter<TestsListState> emit) async {
    emit(state.copyWith(
      status: TestsListStatus.loading,
    ));
    try {
      final tests = await assessmentRepository.getAllTestsByRecruiterId(1);
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

  void getAllTests() {
    add(LoadAllTests());
  }
}
