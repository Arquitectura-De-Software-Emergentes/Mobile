import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/domain/entities/option.dart';
import 'package:teacher_finder/assessment/domain/entities/question.dart';
import 'package:teacher_finder/assessment/infrastructure/inputs/test_question.dart';
import 'package:teacher_finder/assessment/presentation/create_test/bloc/create_test_bloc.dart';
import 'package:teacher_finder/assessment/presentation/questions_list/bloc/questions_list_bloc.dart';

import '../../../common/widgets/custom_app_bar.dart';
import '../../../common/widgets/text_input.dart';
import '../../domain/entities/test.dart';
import 'bloc/create_question_bloc.dart';
import 'widgets/alternatives_list.dart';

class CreateQuestionScreen extends StatelessWidget {
  const CreateQuestionScreen({
    super.key,
    required this.test,
    required this.questionsListBloc,
  });
  final Test test;
  final QuestionsListBloc questionsListBloc;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => CreateQuestionBloc(),
        child: CreateQuestionForm(
          questionsListBloc: questionsListBloc,
          test: test,
        ),
      ),
    );
  }
}

class CreateQuestionForm extends StatefulWidget {
  const CreateQuestionForm({
    Key? key,
    required this.questionsListBloc,
    required this.test,
  }) : super(key: key);

  final Test test;
  final QuestionsListBloc questionsListBloc;

  @override
  _CreateQuestionFormState createState() => _CreateQuestionFormState();
}

class _CreateQuestionFormState extends State<CreateQuestionForm> {
  CorrectAlternative? correctAlternative;

  void handleCorrectAlternativeSelected(CorrectAlternative alternative) {
    setState(() {
      correctAlternative = alternative;
    });
  }

  @override
  Widget build(BuildContext context) {
    final createQuestionBloc = context.watch<CreateQuestionBloc>();
    final testQuestion = createQuestionBloc.state.testQuestion;
    final alternativeA = createQuestionBloc.state.alternativeA;
    final alternativeB = createQuestionBloc.state.alternativeB;
    final alternativeC = createQuestionBloc.state.alternativeC;
    final alternativeD = createQuestionBloc.state.alternativeD;
    final alternativeE = createQuestionBloc.state.alternativeE;
    final points = createQuestionBloc.state.points;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextInput(
                onChanged: (value) =>
                    createQuestionBloc.testQuestionChanged(value),
                title: 'Question',
                label: 'Start typing your question...',
                maxLines: 3,
                errorMessage: testQuestion.errorMessage,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: SizedBox(
                  width: 150,
                  child: TextInput(
                    onChanged: (value) => createQuestionBloc.points(value),
                    title: 'Points',
                    label: '',
                    maxLines: 1,
                    errorMessage: points.errorMessage,
                  ),
                ),
              ),
              AlternativesList(
                createQuestionBloc: createQuestionBloc,
                onCorrectAlternativeSelected: handleCorrectAlternativeSelected,
              ),
              ElevatedButton(
                onPressed: createQuestionBloc.state.isValid
                    ? () {
                        final Question question = Question(
                          id: 1,
                          statement: testQuestion.value,
                          options: [
                            Option(
                              id: 1,
                              response: alternativeA.value,
                              isCorrect:
                                  correctAlternative == CorrectAlternative.A,
                            ),
                            Option(
                              id: 2,
                              response: alternativeB.value,
                              isCorrect:
                                  correctAlternative == CorrectAlternative.B,
                            ),
                            Option(
                              id: 3,
                              response: alternativeC.value,
                              isCorrect:
                                  correctAlternative == CorrectAlternative.C,
                            ),
                            Option(
                              id: 4,
                              response: alternativeD.value,
                              isCorrect:
                                  correctAlternative == CorrectAlternative.D,
                            ),
                            Option(
                              id: 5,
                              response: alternativeE.value,
                              isCorrect:
                                  correctAlternative == CorrectAlternative.E,
                            ),
                          ],
                          points: int.tryParse(points.value),
                          responseId: 0,
                        );

                        widget.questionsListBloc
                            .addQuestion(question, widget.test.id);
                        Navigator.pop(context);
                      }
                    : null,
                child: const Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
