import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:teacher_finder/assessment/infrastructure/repositories/assessment_repository.dart';

import '../../../domain/entities/question.dart';
import '../../../domain/entities/test.dart';

part 'questions_list_event.dart';
part 'questions_list_state.dart';

class QuestionsListBloc extends Bloc<QuestionsListEvent, QuestionsListState> {
  final AssessmentRepository assessmentRepository;
  QuestionsListBloc()
      : assessmentRepository = GetIt.instance<AssessmentRepository>(),
        super(const QuestionsListState()) {
    on<LoadAllQuestions>(_onGetAllQuestions);
    on<AddQuestion>(_onCreateQuestions);
    on<DeleteQuestion>(_onDeleteQuestion);
  }
  void _onGetAllQuestions(
      LoadAllQuestions event, Emitter<QuestionsListState> emit) async {
    emit(state.copyWith(status: QuestionsListStatus.loading));
    try {
      final Test test =
          await assessmentRepository.getAllQuestionsByTestId(event.testId);
      return emit(state.copyWith(
        status: QuestionsListStatus.success,
        questions: test.questions,
      ));
    } catch (error) {
      emit(state.copyWith(
          status: QuestionsListStatus.error, errorMessage: error.toString()));
    }
  }

  void _onCreateQuestions(
      AddQuestion event, Emitter<QuestionsListState> emit) async {
    emit(state.copyWith(status: QuestionsListStatus.loading));
    try {
      final List<Question> currentList = state.questions;
      final List<Question> updatedList = List<Question>.from(currentList);
      print('testIdddd: ${event.testId}');
      await assessmentRepository.createQuestion(event.question, event.testId);
      updatedList.add(event.question);
      emit(state.copyWith(
        status: QuestionsListStatus.success,
        questions: updatedList,
      ));
    } catch (error) {
      emit(state.copyWith(
        errorMessage: error.toString(),
        status: QuestionsListStatus.error,
      ));
    }
  }

  void _onDeleteQuestion(
    DeleteQuestion event,
    Emitter<QuestionsListState> emit,
  ) async {
    emit(state.copyWith(status: QuestionsListStatus.loading));
    try {
      //  final List<Question> currentList = state.questions;
      //final List<Question> updatedList = List<Question>.from(currentList);

      // Buscar y eliminar la pregunta de la lista
      //updatedList.remove(event.question);

      emit(state.copyWith(
        status: QuestionsListStatus.success,
        //questions: updatedList,
      ));
    } catch (error) {
      emit(state.copyWith(
        errorMessage: error.toString(),
        status: QuestionsListStatus.error,
      ));
    }
  }

  void getAllQuestions(int testId) {
    add(LoadAllQuestions(testId));
  }

  void addQuestion(Question question, int testId) {
    add(AddQuestion(question, testId));
  }

  void deleteQuestion(Question question) {
    add(DeleteQuestion(question));
  }
}
