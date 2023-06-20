import 'package:flutter/material.dart';

class QuestionsTabBar extends StatefulWidget {
  const QuestionsTabBar({super.key});

  @override
  State<QuestionsTabBar> createState() => _QuestionsTabBarState();
}

class _QuestionsTabBarState extends State<QuestionsTabBar>
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
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: TabBar(
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
        TabBarView(
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
      ],
    );
  }
}
