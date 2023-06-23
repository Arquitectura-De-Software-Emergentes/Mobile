import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:teacher_finder/assessment/infrastructure/repositories/assessment_repository.dart';

import '../../../domain/entities/question.dart';

part 'questions_list_event.dart';
part 'questions_list_state.dart';

class QuestionsListBloc extends Bloc<QuestionsListEvent, QuestionsListState> {
  final AssessmentRepository assessmentRepository;
  QuestionsListBloc()
      : assessmentRepository = GetIt.instance<AssessmentRepository>(),
        super(const QuestionsListState()) {
    on<AddQuestion>(_onCreateQuestions);
    on<DeleteQuestion>(_onDeleteQuestion);
  }

  void _onCreateQuestions(
      AddQuestion event, Emitter<QuestionsListState> emit) async {
    emit(state.copyWith(status: QuestionsListStatus.loading));
    try {
      final List<Question> currentList = state.questions;
      final List<Question> updatedList = List<Question>.from(currentList);

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
      final List<Question> currentList = state.questions;
      final List<Question> updatedList = List<Question>.from(currentList);

      // Buscar y eliminar la pregunta de la lista
      updatedList.remove(event.question);

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

  void addQuestion(Question question) {
    add(AddQuestion(question));
  }

  void deleteQuestion(Question question) {
    add(DeleteQuestion(question));
  }
}
