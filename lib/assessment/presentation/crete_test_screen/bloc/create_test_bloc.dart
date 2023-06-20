import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../infrastructure/inputs/test_description.dart';
import '../../../infrastructure/inputs/test_title.dart';

part 'create_test_event.dart';
part 'create_test_state.dart';

class CreateTestBloc extends Bloc<CreateTestEvent, CreateTestState> {
  CreateTestBloc() : super(GeneralInformation()) {
    on<TestTitleChanged>(_testTitleChanged);
    on<TestDescriptionChanged>(_testDescriptionChanged);
  }
  void _testTitleChanged(
      TestTitleChanged event, Emitter<CreateTestState> emit) async {
    final title = TestTitle.dirty(event.title);

    emit(
      (state as GeneralInformation).copyWith(
        title: title,
        isValid: Formz.validate([
          title,
          (state as GeneralInformation).description,
        ]),
      ),
    );
  }

  void _testDescriptionChanged(
      TestDescriptionChanged event, Emitter<CreateTestState> emit) async {
    final description = TestDescription.dirty(event.description);

    emit(
      (state as GeneralInformation).copyWith(
        description: description,
        isValid: Formz.validate([
          (state as GeneralInformation).title,
        ]),
      ),
    );
  }

  void testTitleChanged(String title) {
    add(TestTitleChanged(title));
  }

  void testDescriptionChanged(String description) {
    add(TestDescriptionChanged(description));
  }
}
