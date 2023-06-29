import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:teacher_finder/assessment/infrastructure/repositories/assessment_repository.dart';

import '../../../domain/entities/question.dart';
import '../../../domain/entities/test.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  final AssessmentRepository assessmentRepository;
  TestBloc()
      : assessmentRepository = GetIt.instance<AssessmentRepository>(),
        super(const TestState()) {
    on<LoadAllQuestions>(_onGetAllQuestions);
  }
  void _onGetAllQuestions(
      LoadAllQuestions event, Emitter<TestState> emit) async {
    emit(state.copyWith(status: TestStatus.loading));
    try {
      final Test test =
      await assessmentRepository.getAllQuestionsByTestId(event.testId);
      return emit(state.copyWith(
        status: TestStatus.success,
        questions: test.questions,
      ));
    } catch (error) {
      emit(state.copyWith(
          status: TestStatus.error, errorMessage: error.toString()));
    }
  }

  void getAllQuestions(int testId) {
    add(LoadAllQuestions(testId));
  }
}
