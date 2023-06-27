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
                Text('${test.minScore.toString()} min score'),
              ],
            ),
          ],
        ),
        body: QuestionList(
          questionsListBloc: questionsListBloc,
          test: test,
        ),
      ),
    );
  }
}

class QuestionList extends StatelessWidget {
  const QuestionList({
    super.key,
    required this.questionsListBloc,
    required this.test,
  });
  final QuestionsListBloc questionsListBloc;
  final Test test;

  @override
  Widget build(BuildContext context) {
    context.read<QuestionsListBloc>().getAllQuestions(test.id);
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: BlocBuilder<QuestionsListBloc, QuestionsListState>(
            builder: (context, state) {
              print(state.questions.length);
              return state.questions.isEmpty
                  ? Center(
                      child: state.status == QuestionsListStatus.loading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : const Text(
                              'No questions',
                              style: TextStyle(fontSize: 24),
                            ),
                    )
                  : ListView.builder(
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
                                  Text(question.options[1].response),
                                  Text(question.options[2].response),
                                  Text(question.options[3].response),
                                  Text(question.options[4].response),
                                ],
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  // questionsListBloc.deleteQuestion(question);
                                },
                                icon: const Icon(Icons.remove_circle_outline),
                              ),
                            ),
                          ),
                        );
                      },
                    );
            },
          ),
        ),
        ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                isScrollControlled: true,
                builder: (context) => DraggableScrollableSheet(
                  initialChildSize: 0.9,
                  expand: false,
                  builder: (context, scrollController) => SizedBox(
                    child: SingleChildScrollView(
                        child: CreateQuestionScreen(
                      questionsListBloc: questionsListBloc,
                      test: test,
                    )),
                  ),
                ),
              );
            },
            child: const Text('add'))
      ],
    );
  }
}
