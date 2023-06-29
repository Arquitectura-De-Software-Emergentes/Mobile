import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:teacher_finder/splash_screen.dart';
import 'package:teacher_finder/common/styles/styles.dart';
import 'package:teacher_finder/common/widgets/custom_drawer.dart';
import 'package:teacher_finder/injections.dart';
import 'package:teacher_finder/offers/presentation/offers_list/offers_list_screen.dart';
import 'dart:io';
import 'common/widgets/custom_app_bar.dart';
import 'offers/presentation/my_offers_list/my_offers_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  offerDependencies();
  assessmentDependencies();
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

// certificates
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

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
      home: const SplashScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: const CustomAppBar(
        title: 'Teacher Finder',
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
                    builder: (context) => OffersListScreen(),
                  ),
                );
              },
              child: const Text('Teacher'),
            ),
            const SizedBox(height: 15),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyOffersListScreen(),
                  ),
                );
              },
              child: const Text('Recruiter'),
            ),
          ],
        ),
      ),
    );
  }
}
