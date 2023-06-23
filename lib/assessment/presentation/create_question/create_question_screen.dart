import 'package:flutter/material.dart';

import '../../../common/widgets/custom_app_bar.dart';
import '../../../common/widgets/text_input.dart';
import 'widgets/alternatives_list.dart';

class CreateQuestionScreen extends StatelessWidget {
  const CreateQuestionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Question'),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextInput(
                title: 'Question',
                label: 'Start typing your question...',
                maxLines: 3,
                //onChanged: (value) => createTestBloc.testQuestionChanged(value),
                //errorMessage: question.errorMessage,
              ),
              const AlternativesList(),
              ElevatedButton(
                  onPressed: () {}, child: const Text('Add Question'))
            ],
          ),
        ),
      ),
    );
  }
}
