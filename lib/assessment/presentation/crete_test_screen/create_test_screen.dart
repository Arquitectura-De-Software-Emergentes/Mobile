import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/presentation/crete_test_screen/bloc/create_test_bloc.dart';

import '../../../common/widgets/custom_app_bar.dart';
import 'widgets/create_test_form.dart';
import 'widgets/questions_list.dart';

class CreateTestScreen extends StatelessWidget {
  const CreateTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: change bloc
    return BlocProvider(
      create: (context) => CreateTestBloc(),
      child: const Scaffold(
        appBar: CustomAppBar(
          title: 'Create Test',
        ),
        body: Padding(
          padding: EdgeInsets.all(12.0),
          child: CreateTestForm(),
        ),
        bottomNavigationBar: QuestionsList(),
      ),
    );
  }
}
