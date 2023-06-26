import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/domain/entities/test.dart';
import 'package:teacher_finder/assessment/presentation/create_test/bloc/create_test_bloc.dart';
import 'package:teacher_finder/assessment/presentation/create_test/widgets/general_information_panel.dart';
import 'package:teacher_finder/assessment/presentation/questions_list/questions_list_screen.dart';
import 'package:teacher_finder/assessment/presentation/tests_list/bloc/tests_list_bloc.dart';

import '../../../common/widgets/custom_app_bar.dart';
import '../create_question/create_question_screen.dart';
import '../questions_list/bloc/questions_list_bloc.dart';

class CreateTestScreen extends StatefulWidget {
  const CreateTestScreen({super.key, required this.testsListBloc});

  final TestsListBloc testsListBloc;
  @override
  State<CreateTestScreen> createState() => _CreateTestScreenState();
}

class _CreateTestScreenState extends State<CreateTestScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  final QuestionsListBloc questionsListBloc = QuestionsListBloc();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreateTestBloc(),
        ),
        BlocProvider(
          create: (context) => questionsListBloc,
        ),
      ],
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Create Test',
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GeneralInformationPanel(
                testsListBloc: widget.testsListBloc,
              ),
              ElevatedButton(
                onPressed: () {
                  final Test test = Test(
                      id: 1,
                      title: 'test 7',
                      numQuestions: 20,
                      minScore: 13,
                      questions: []);
                  widget.testsListBloc.addTest(test);
                  Navigator.pop(context);
                },
                child: const Text('Borrame'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
