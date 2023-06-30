import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/infrastructure/data_sources/assessment_remote_data_provider.dart';
import 'package:teacher_finder/assessment/presentation/test_result/test_result.dart';
import 'package:teacher_finder/common/user_config/user_config.dart';

import '../../../common/styles/styles.dart';
import '../../domain/entities/question.dart';
import '../questions_list/bloc/questions_list_bloc.dart';

enum CorrectAlternative { A, B, C, D, E }

class TestScreen extends StatelessWidget {
  TestScreen({super.key, required this.testId, required this.jobOfferId});
  final int testId;
  final int jobOfferId;
  final int _duration = 1800;
  final CountDownController _controller = CountDownController();

  final QuestionsListBloc questionsListBloc = QuestionsListBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Test',
        ),
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
                  return "END";
                } else {
                  return Function.apply(defaultFormatterFunction, [duration]);
                }
              },
            ),
          ),
          BlocProvider(
            create: (context) => questionsListBloc,
            child: QuestionsByTest(
              jobOfferId: jobOfferId,
              testId: testId,
              questionsListBloc: questionsListBloc,
            ),
          )
        ],
      ),
    );
  }
}

class QuestionsByTest extends StatefulWidget {
  const QuestionsByTest({
    super.key,
    required this.questionsListBloc,
    required this.testId,
    required this.jobOfferId,
  });
  final int testId;
  final int jobOfferId;
  final QuestionsListBloc questionsListBloc;

  @override
  State<QuestionsByTest> createState() => _QuestionsByTestState();
}

class _QuestionsByTestState extends State<QuestionsByTest> {
  Map<int, int?> _selectedAlternatives = {};
  Map<int, int?> get selectedAlternatives => _selectedAlternatives;

  Future<void> _showDialog(BuildContext context, int jobOfferId,
      int applicantId, List<Question> questions) async {
    await showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Are you sure ?'),
          actions: [
            SizedBox(
              height: 30,
              width: 90,
              child: ElevatedButton(
                onPressed: () async {
                  final assessmentRemoteDataProvider =
                      AssessmentRemoteDataProvider();

                  final objectResult = await assessmentRemoteDataProvider
                      .submitTest(questions, widget.jobOfferId, applicantId);

                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TestResultScreen(
                                objectResult: objectResult,
                              )),
                      (route) => false);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Styles.secondaryColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text(
                  "OK",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 30,
              width: 90,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Styles.secondaryColor,
                    side: BorderSide.none,
                    shape: const StadiumBorder()),
                child: const Text(
                  "CANCEL",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _handleSubmitButtonPressed(
    Map<int, int?> selectedAlternatives,
    BuildContext context,
    List<Question> questions,
  ) async {
    selectedAlternatives.forEach((index, alternativeId) {
      Question question = questions[index];
      question.responseId = alternativeId;
    });
    List<Question> questionsWhitResponse = [];
    questions.forEach((question) {
      questionsWhitResponse.add(question);
    });
    int applicantId = await UserConfig.getUserId();
    _showDialog(context, widget.jobOfferId, applicantId, questionsWhitResponse);
  }

  @override
  Widget build(BuildContext context) {
    context.read<QuestionsListBloc>().getAllQuestions(widget.testId);

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
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
                  : Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              _handleSubmitButtonPressed(selectedAlternatives,
                                  context, state.questions);
                            },
                            child: const Text(
                              'SUBMIT',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        Expanded(
                          child: ListView.builder(
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
                                        Text(
                                          '${index + 1}) ',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          question.statement,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    subtitle: SizedBox(
                                      height: 270,
                                      child: ListView.builder(
                                        itemCount: question.options.length,
                                        itemBuilder: (BuildContext context,
                                            int optionIndex) {
                                          final option =
                                              question.options[optionIndex];
                                          return Row(
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Transform.scale(
                                                  scale: 1,
                                                  child: Radio<int>(
                                                    groupValue:
                                                        _selectedAlternatives
                                                                .containsKey(
                                                                    index)
                                                            ? _selectedAlternatives[
                                                                index]
                                                            : null,
                                                    activeColor: Colors.green,
                                                    value: option.id,
                                                    onChanged: (int? value) {
                                                      setState(() {
                                                        _selectedAlternatives[
                                                                index] =
                                                            question
                                                                .options[
                                                                    optionIndex]
                                                                .id;
                                                      });
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
                                    trailing: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.green),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                            '${question.points.toString()}p.'),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
      ],
    );
  }
}
