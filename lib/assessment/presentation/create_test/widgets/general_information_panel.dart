import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/presentation/create_test/bloc/create_test_bloc.dart';
import 'package:teacher_finder/assessment/presentation/tests_list/bloc/tests_list_bloc.dart';

import '../../../../common/widgets/text_input.dart';
import '../../../domain/entities/test.dart';

class GeneralInformationPanel extends StatefulWidget {
  const GeneralInformationPanel({super.key, required this.testsListBloc});
  final TestsListBloc testsListBloc;
  @override
  State<GeneralInformationPanel> createState() =>
      _GeneralInformationPanelState();
}

class _GeneralInformationPanelState extends State<GeneralInformationPanel> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final createTestBloc = context.watch<CreateTestBloc>();
    final title = createTestBloc.state.title;
    final minScore = createTestBloc.state.minScore;

    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'General information ',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.check_circle_rounded,
                size: 30,
                color: createTestBloc.state.isValidGeneralInformation
                    ? Colors.green
                    : Colors.grey,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              TextInput(
                title: 'Title',
                label: 'Enter test title...',
                onChanged: (value) => createTestBloc.testTitleChanged(value),
                errorMessage: title.errorMessage,
              ),
              TextInput(
                title: 'Min Score',
                label: 'Enter a min score...',
                onChanged: (value) => createTestBloc.testMinScoreChanged(value),
                errorMessage: minScore.errorMessage,
              ),
              OutlinedButton(
                  onPressed: createTestBloc.state.isValidGeneralInformation
                      ? () {
                          final Test test = Test(
                              id: 1,
                              title: title.value,
                              numQuestions: 0,
                              minScore: int.parse(minScore.value),
                              questions: []);
                          widget.testsListBloc.addTest(test);
                          Navigator.pop(context);
                        }
                      : null,
                  child: const Text('OK'))
            ],
          ),
        ),
      ],
    );
  }
}
