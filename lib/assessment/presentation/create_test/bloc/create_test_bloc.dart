import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../domain/entities/question.dart';
import '../../../infrastructure/inputs/test_min_score.dart';
import '../../../infrastructure/inputs/test_question.dart';
import '../../../infrastructure/inputs/test_title.dart';

part 'create_test_event.dart';
part 'create_test_state.dart';

class CreateTestBloc extends Bloc<CreateTestEvent, CreateTestState> {
  CreateTestBloc() : super(const CreateTestState()) {
    on<TestTitleChanged>(_testTitleChanged);
    on<TestQuestionChanged>(_testQuestionChanged);
    on<TestMinScoreChanged>(_testMinScoreChanged);
  }
  void _testTitleChanged(
      TestTitleChanged event, Emitter<CreateTestState> emit) async {
    final title = TestTitle.dirty(event.title);

    emit(
      state.copyWith(
        title: title,
        isValidGeneralInformation: Formz.validate([title, state.minScore]),
      ),
    );
  }

  void _testMinScoreChanged(
      TestMinScoreChanged event, Emitter<CreateTestState> emit) async {
    final minScore = TestMinScore.dirty(event.minScore);
    emit(
      state.copyWith(
        minScore: minScore,
        isValidGeneralInformation: Formz.validate([
          minScore,
          state.title,
        ]),
      ),
    );
  }

  void _testQuestionChanged(
      TestQuestionChanged event, Emitter<CreateTestState> emit) async {
    final testQuestion = TestQuestion.dirty(event.testQuestion);
    emit(
      state.copyWith(
        testQuestion: testQuestion,
        isValidQuestion: Formz.validate([testQuestion]),
      ),
    );
  }

  void testTitleChanged(String title) {
    add(TestTitleChanged(title));
  }

  void testQuestionChanged(String question) {
    add(TestQuestionChanged(question));
  }

  void testMinScoreChanged(String minScore) {
    add(TestMinScoreChanged(minScore));
  }
}
