import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/presentation/create_test/bloc/create_test_bloc.dart';

import '../../../../common/widgets/text_input.dart';

class GeneralInformationPanel extends StatefulWidget {
  const GeneralInformationPanel({super.key});

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
    final description = createTestBloc.state.description;
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          this.isExpanded = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          isExpanded: isExpanded,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text('General information'),
                  Icon(
                    Icons.check_circle_rounded,
                    color: createTestBloc.state.isValidGeneralInformation
                        ? Colors.green
                        : Colors.grey,
                  )
                ],
              ),
            );
          },
          body: Padding(
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
                  title: 'Description',
                  label: 'Enter test description...',
                  onChanged: (value) =>
                      createTestBloc.testDescriptionChanged(value),
                  errorMessage: description.errorMessage,
                ),
                OutlinedButton(
                    onPressed: createTestBloc.state.isValidGeneralInformation
                        ? () => {
                              setState(() {
                                isExpanded = false;
                              })
                            }
                        : null,
                    child: const Text('OK'))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
