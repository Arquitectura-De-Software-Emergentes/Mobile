import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/presentation/create_test/create_test_screen.dart';
import 'package:teacher_finder/assessment/presentation/tests_list/bloc/tests_list_bloc.dart';
import 'package:teacher_finder/common/widgets/custom_app_bar.dart';

import '../../domain/entities/test.dart';

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
      ),
    );
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
              return state.tests == 0
                  ? const Center(
                      child: Text('NO TESTS'),
                    )
                  : ListView.builder(
                      itemCount: state.tests.length,
                      itemBuilder: (BuildContext context, int index) {
                        Test test = state.tests[index];
                        return GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(32)),
                              ),
                              isScrollControlled: true,
                              builder: (context) => DraggableScrollableSheet(
                                initialChildSize: 0.6,
                                maxChildSize: 0.6,
                                expand: false,
                                builder: (context, scrollController) =>
                                    SizedBox(
                                  child: SingleChildScrollView(
                                      child: Text('detail')),
                                ),
                              ),
                            );
                          },
                          child: Text('card'),
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
