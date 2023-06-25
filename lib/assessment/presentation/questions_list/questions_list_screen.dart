import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/domain/entities/question.dart';
import 'package:teacher_finder/assessment/presentation/questions_list/bloc/questions_list_bloc.dart';

import '../../domain/entities/test.dart';
import '../create_question/create_question_screen.dart';

class QuestionListScreen extends StatelessWidget {
  QuestionListScreen({super.key, required this.test});
  final Test test;
  final QuestionsListBloc questionsListBloc = QuestionsListBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuestionsListBloc>(
      create: (context) => questionsListBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            test.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${test.numQuestions.toString()} questions'),
                Text('${test.minScore.toString()} min score'),
              ],
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: BlocBuilder<QuestionsListBloc, QuestionsListState>(
                builder: (context, state) {
                  return state.questions.isEmpty
                      ? const Center(
                          child: Text(
                            'No questions',
                            style: TextStyle(fontSize: 24),
                          ),
                        )
                      : const QuestionList();
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateQuestionScreen(
                      questionsListBloc: questionsListBloc,
                    ),
                  ),
                );
              },
              child: const Text('Add Question'),
            ),
            const Expanded(
              child: QuestionList(),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionList extends StatelessWidget {
  const QuestionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final questionsListBloc = context.watch<QuestionsListBloc>();

    return BlocBuilder<QuestionsListBloc, QuestionsListState>(
      builder: (context, state) {
        if (state.status == QuestionsListStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status == QuestionsListStatus.success) {
          return ListView.builder(
            itemCount: state.questions.length,
            itemBuilder: (BuildContext context, int index) {
              Question question = state.questions[index];
              return GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(
                        '${question.statement} (${question.points.toString()})'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(question.options[0].response),
                        Text(question.options[0].response),
                        Text(question.options[0].response),
                        Text(question.options[0].response),
                        Text(question.options[0].response),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        questionsListBloc.deleteQuestion(question);
                      },
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state.status == QuestionsListStatus.error) {
          return Center(child: Text(state.errorMessage));
        }

        return Container();
      },
    );
  }
}
