import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../infrastructure/inputs/question.dart';
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
    final question = TestQuestion.dirty(event.question);
    emit(
      state.copyWith(
        question: question,
        isValidQuestion: Formz.validate([question]),
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
