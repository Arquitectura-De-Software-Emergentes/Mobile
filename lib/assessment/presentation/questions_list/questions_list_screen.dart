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
                                  '${index + 1})  ${question.statement} (${question.points.toString()})'),
                              subtitle: SizedBox(
                                height: 100,
                                child: ListView.builder(
                                  itemCount: question.options.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final option = question.options[index];
                                    return Text(
                                        '      \u2022 ${option.response}');
                                  },
                                ),
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
                  initialChildSize: 0.95,
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
