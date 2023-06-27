import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/presentation/create_test/create_test_screen.dart';
import 'package:teacher_finder/assessment/presentation/tests_list/bloc/tests_list_bloc.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';

import '../../../common/styles/styles.dart';
import '../../domain/entities/test.dart';
import '../create_question/create_question_screen.dart';
import '../create_test/widgets/general_information_panel.dart';
import '../questions_list/bloc/questions_list_bloc.dart';
import '../questions_list/bloc/questions_list_bloc.dart';
import '../questions_list/questions_list_screen.dart';

class TestsListScreen extends StatelessWidget {
  TestsListScreen({super.key});
  final TestsListBloc testsListBloc = TestsListBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => testsListBloc,
        child: Scaffold(
          appBar: const CustomAppBar(title: 'Test'),
          body: const TestsList(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CreateTestScreen(testsListBloc: testsListBloc),
                ),
              );
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ));
  }
}

class TestsList extends StatelessWidget {
  const TestsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<TestsListBloc>().getAllTests();

    return Column(children: [
      const SizedBox(
        height: 15,
      ),
      Expanded(
        child: BlocBuilder<TestsListBloc, TestsListState>(
          builder: (context, state) {
            if (state.status == TestsListStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.status == TestsListStatus.success) {
              return state.tests.isEmpty
                  ? const Center(
                      child: Text('NO TESTS'),
                    )
                  : ListView.builder(
                      itemCount: state.tests.length,
                      itemBuilder: (BuildContext context, int index) {
                        Test test = state.tests[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => QuestionListScreen(
                                          test: test,
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    ListTile(
                                      leading: Text(
                                        test.title,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      title: Column(
                                        children: [
                                          Text(
                                              '${test.minScore.toString()} min score'),
                                        ],
                                      ),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.add),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  height: 10,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
            } else if (state.status == TestsListStatus.error) {
              return Center(child: Text(state.errorMessage));
            }

            return Container();
          },
        ),
      ),
    ]);
  }
}
