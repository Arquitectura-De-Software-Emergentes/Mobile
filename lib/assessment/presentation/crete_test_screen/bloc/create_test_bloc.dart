import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../domain/entities/question.dart';
import '../../../infrastructure/inputs/test_question.dart';
import '../../../infrastructure/inputs/test_description.dart';
import '../../../infrastructure/inputs/test_title.dart';

part 'create_test_event.dart';
part 'create_test_state.dart';

class CreateTestBloc extends Bloc<CreateTestEvent, CreateTestState> {
  CreateTestBloc() : super(const CreateTestState()) {
    on<TestTitleChanged>(_testTitleChanged);
    on<TestDescriptionChanged>(_testDescriptionChanged);
    on<TestQuestionChanged>(_testQuestionChanged);
  }
  void _testTitleChanged(
      TestTitleChanged event, Emitter<CreateTestState> emit) async {
    final title = TestTitle.dirty(event.title);

    emit(
      state.copyWith(
        title: title,
        isValidGeneralInformation: Formz.validate([
          title,
          state.description,
        ]),
      ),
    );
  }

  void _testDescriptionChanged(
      TestDescriptionChanged event, Emitter<CreateTestState> emit) async {
    final description = TestDescription.dirty(event.description);

    emit(
      state.copyWith(
        description: description,
        isValidGeneralInformation: Formz.validate([
          state.title,
          description,
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

  void testDescriptionChanged(String description) {
    add(TestDescriptionChanged(description));
  }

  void testQuestionChanged(String question) {
    add(TestQuestionChanged(question));
  }
}
