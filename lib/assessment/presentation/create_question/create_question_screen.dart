import 'package:flutter/material.dart';
import 'package:teacher_finder/assessment/domain/entities/option.dart';
import 'package:teacher_finder/assessment/domain/entities/question.dart';
import 'package:teacher_finder/assessment/presentation/questions_list/bloc/questions_list_bloc.dart';

import '../../../common/widgets/custom_app_bar.dart';
import '../../../common/widgets/text_input.dart';
import 'widgets/alternatives_list.dart';

class CreateQuestionScreen extends StatelessWidget {
  const CreateQuestionScreen({
    super.key,
    required this.questionsListBloc,
  });

  final QuestionsListBloc questionsListBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Add Question'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
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
                    onPressed: () {
                      final Question question = Question(
                          id: 1,
                          statement: 'hola?',
                          options: [
                            Option(id: 1, response: 'aads', isCorrect: true),
                            Option(id: 2, response: 'as', isCorrect: false),
                          ],
                          points: 2,
                          responseId: 1);
                      questionsListBloc.addQuestion(question);
                      Navigator.pop(context);
                    },
                    child: const Text('Add'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
