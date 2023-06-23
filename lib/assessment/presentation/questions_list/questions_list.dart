import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/domain/entities/question.dart';
import 'package:teacher_finder/assessment/presentation/questions_list/bloc/questions_list_bloc.dart';

class QuestionList extends StatelessWidget {
  const QuestionList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<QuestionsListBloc, QuestionsListState>(
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
                          context
                              .read<QuestionsListBloc>()
                              .deleteQuestion(question);
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
      ),
    );
  }
}
