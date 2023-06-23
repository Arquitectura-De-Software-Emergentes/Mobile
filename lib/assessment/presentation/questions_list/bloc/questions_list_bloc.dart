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
    on<QuestionsListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }

  void _onGetAllMyQuestions(
      LoadAllQuestions event, Emitter<QuestionsListState> emit) async {
    emit(state.copyWith(status: QuestionsListStatus.loading));
    try {
      final List<Question> questions =
          await assessmentRepository.getAllQuestionsByTestId(1);
    } catch (error) {
      emit(state.copyWith(
        errorMessage: error.toString(),
        status: QuestionsListStatus.error,
      ));
    }
  }
}
