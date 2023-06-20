import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/presentation/crete_test_screen/bloc/create_test_bloc.dart';
import 'package:teacher_finder/assessment/presentation/crete_test_screen/widgets/questions_tap_bar.dart';

import '../../../../common/widgets/text_input.dart';
import 'alternatives_list.dart';
import 'general_information_panel.dart';

class CreateTestForm extends StatelessWidget {
  const CreateTestForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final createTestBloc = context.watch<CreateTestBloc>();
    final question = createTestBloc.state.question;
    return SingleChildScrollView(
      child: Column(
        children: [
          const QuestionsTabBar(),
          const GeneralInformationPanel(),
          const SizedBox(
            height: 20,
          ),
          TextInput(
            title: 'Question',
            label: 'Start typing your question...',
            maxLines: 3,
            onChanged: (value) => createTestBloc.testQuestionChanged(value),
            errorMessage: question.errorMessage,
          ),
          AlternativesList(),
        ],
      ),
    );
  }
}
