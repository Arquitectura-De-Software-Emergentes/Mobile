import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/presentation/crete_test_screen/bloc/create_test_bloc.dart';
import 'package:teacher_finder/assessment/presentation/crete_test_screen/widgets/general_information_panel.dart';
import 'package:teacher_finder/common/widgets/text_input.dart';

import '../../../common/widgets/custom_app_bar.dart';
import 'widgets/create_test_form.dart';
import 'widgets/questions_list.dart';

class CreateTestScreen extends StatefulWidget {
  const CreateTestScreen({super.key});

  @override
  State<CreateTestScreen> createState() => _CreateTestScreenState();
}

class _CreateTestScreenState extends State<CreateTestScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

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
    return BlocProvider(
      create: (context) => CreateTestBloc(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Create Test',
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const GeneralInformationPanel(),
              const Center(
                child: Text('No questions'),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateTestForm(),
                      ),
                    );
                  },
                  child: const Text('Add Question'))
            ],
          ),
        ),
      ),
    );
  }
}
