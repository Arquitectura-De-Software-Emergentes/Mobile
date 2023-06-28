import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/presentation/create_test/create_test_screen.dart';
import 'package:teacher_finder/assessment/presentation/tests_list/bloc/tests_list_bloc.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';

import '../../domain/entities/test.dart';
import '../questions_list/questions_list_screen.dart';

class TestsListScreen extends StatelessWidget {
  TestsListScreen({Key? key}) : super(key: key);
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
  const TestsList({Key? key}) : super(key: key);

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
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                QuestionListScreen(
                                              test: test,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Icon(Icons.list_alt),
                                              Text(
                                                test.title,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            QuestionListScreen(
                                                          test: test,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Text('ADD QUESTIONS'))
                                            ]),
                                      ),
                                    )
                                  ],
                                ),
                                const Divider(
                                  height: 10,
                                  color: Colors.black,
                                ),
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
