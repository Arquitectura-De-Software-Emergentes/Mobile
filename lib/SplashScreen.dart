import 'package:flutter/material.dart';
import 'package:teacher_finder/common/styles/styles.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Future.delayed(const Duration(seconds: 2),(){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const HomePage(),
          ),
    );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.tag_faces, size: 250),
            SizedBox(height: 40),
            CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      )
    );
  }
}
