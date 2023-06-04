import 'package:flutter/material.dart';
import 'package:teacher_finder/common/styles/styles.dart';
import 'package:teacher_finder/offers/presentation/offers_list/offers_list_screen.dart';
import 'package:teacher_finder/profiles/profile_teacher_screen.dart';

import 'offers/presentation/my_offers_list/my_offers_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          primary: Styles.primaryColor,
          secondary: Styles.secondaryColor,
          onPrimary: Styles.black,
          primaryContainer: const Color(0xFF171740),
          surface: Colors.white,
        ),
        fontFamily: Styles.fontFamily,
      ),
      home: const HomePage (),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teacher Finder'),
        backgroundColor: Styles.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OffersListScreen()));
                },
                child: const Text('Teacher')),
            const SizedBox(
              height: 15,
            ),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyOffersListScreen()));
                },
                child: const Text('Recruiter')),
          ],
        ),
      ),
    );
  }
}
