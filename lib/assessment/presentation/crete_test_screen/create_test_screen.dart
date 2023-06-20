import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teacher_finder/assessment/presentation/crete_test_screen/bloc/create_test_bloc.dart';
import 'package:teacher_finder/assessment/presentation/crete_test_screen/widgets/general_information_panel.dart';

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
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('hola'),
            bottom: TabBar(
              controller: _tabController,
              tabs: const <Widget>[
                Tab(
                  icon: Icon(Icons.cloud_outlined),
                ),
                Tab(
                  icon: Icon(Icons.beach_access_sharp),
                ),
                Tab(
                  icon: Icon(Icons.brightness_5_sharp),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: const <Widget>[
              SizedBox(
                width: 50,
                child: Center(
                  child: Text("It's cloudy here"),
                ),
              ),
              SizedBox(
                width: 50,
                child: Center(
                  child: Text("It's cloudy 2"),
                ),
              ),
              SizedBox(
                width: 50,
                child: Center(
                  child: Text("It's cloudy 3"),
                ),
              ),
            ],
          ),
          //bottomNavigationBar: QuestionsList(),
        ),
      ),
    );
  }
}
