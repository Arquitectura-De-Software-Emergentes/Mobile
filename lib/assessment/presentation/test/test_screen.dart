import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/styles/styles.dart';
import '../../domain/entities/question.dart';
import '../questions_list/bloc/questions_list_bloc.dart';

enum CorrectAlternative { A, B, C, D, E }

class TestScreen extends StatelessWidget {
  TestScreen({super.key});
  final int _duration = 1200;
  final CountDownController _controller = CountDownController();

  final QuestionsListBloc questionsListBloc = QuestionsListBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Test',
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'SUBMIT',
                style: TextStyle(
                    color: Styles.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ))
        ],
      ),
      body: Column(
        children: [
          Center(
            child: CircularCountDownTimer(
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.height / 5,
              duration: _duration,
              fillColor: Colors.purple,
              ringColor: Colors.grey[300]!,
              controller: _controller,
              isReverse: true,
              onStart: () {
                debugPrint('Countdown Started');
              },
              onComplete: () {
                debugPrint('Countdown Ended');
              },
              onChange: (String timeStamp) {
                debugPrint('Countdown Changed $timeStamp');
              },
              timeFormatterFunction: (defaultFormatterFunction, duration) {
                if (duration.inSeconds == 0) {
                  return "Start";
                } else {
                  return Function.apply(defaultFormatterFunction, [duration]);
                }
              },
            ),
          ),
          BlocProvider(
            create: (context) => questionsListBloc,
            child: QuestionsByTest(
              questionsListBloc: questionsListBloc,
            ),
          )
        ],
      ),
    );
  }
}

class QuestionsByTest extends StatefulWidget {
  QuestionsByTest({
    super.key,
    required this.questionsListBloc,
  });
  final QuestionsListBloc questionsListBloc;

  @override
  State<QuestionsByTest> createState() => _QuestionsByTestState();
}

class _QuestionsByTestState extends State<QuestionsByTest> {
  CorrectAlternative? _alternative = CorrectAlternative.A;

  @override
  Widget build(BuildContext context) {
    context.read<QuestionsListBloc>().getAllQuestions(2);

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
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
                          title: Row(
                            children: [
                              Text('${index + 1}'),
                              Text(question.statement),
                            ],
                          ),
                          subtitle: SizedBox(
                            height: 270,
                            child: ListView.builder(
                              itemCount: question.options.length,
                              itemBuilder: (BuildContext context, int index) {
                                final option = question.options[index];
                                return Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Transform.scale(
                                        scale: 1,
                                        child: Radio<CorrectAlternative>(
                                          activeColor: Colors.green,
                                          value: CorrectAlternative.B,
                                          groupValue: _alternative,
                                          onChanged:
                                              (CorrectAlternative? value) {
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                    ),
                                    Text(option.response),
                                  ],
                                );
                              },
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              // questionsListBloc.deleteQuestion(question);
                            },
                            icon: Text(question.points.toString()),
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
