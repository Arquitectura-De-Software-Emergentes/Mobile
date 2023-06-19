import 'package:flutter/material.dart';

import '../../../../common/widgets/text_input.dart';
import 'alternatives_list.dart';
import 'general_information_panel.dart';

class CreateTestForm extends StatelessWidget {
  const CreateTestForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const GeneralInformationPanel(),
        const SizedBox(
          height: 20,
        ),
        TextInput(
          title: 'Question',
          label: 'Start typing your question...',
          maxLines: 3,
        ),
        AlternativesList(),
      ],
    );
  }
}
