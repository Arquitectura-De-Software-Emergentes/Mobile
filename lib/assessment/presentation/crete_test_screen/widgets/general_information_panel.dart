import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/presentation/crete_test_screen/bloc/create_test_bloc.dart';

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
    final generalInformationBloc = context.watch<CreateTestBloc>();
    final title = (generalInformationBloc.state as GeneralInformation).title;
    final description =
        (generalInformationBloc.state as GeneralInformation).description;

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
                    color: (generalInformationBloc.state as GeneralInformation)
                            .isValid
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
                  onChanged: (value) =>
                      generalInformationBloc.testTitleChanged(value),
                  errorMessage: title.errorMessage,
                ),
                TextInput(
                  title: 'Description',
                  label: 'Enter test description...',
                  onChanged: (value) =>
                      generalInformationBloc.testDescriptionChanged(value),
                  errorMessage: description.errorMessage,
                ),
                OutlinedButton(
                    onPressed:
                        (generalInformationBloc.state as GeneralInformation)
                                .isValid
                            ? () => {
                                  setState(() {
                                    isExpanded = false;
                                  })
                                }
                            : null,
                    /*{
                      setState(() {
                        isExpanded = false;
                      });
                    }*/
                    child: const Text('OK'))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
