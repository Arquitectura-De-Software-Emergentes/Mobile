//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:teacher_finder/splash_screen.dart';
import 'package:teacher_finder/common/styles/styles.dart';
import 'package:teacher_finder/injections.dart';
import 'dart:io';

void main() async {
  await dotenv.load(
    fileName: '.env',
  );
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
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
      home: SplashScreen(),
    );
  }
}
