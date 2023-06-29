import 'package:flutter/material.dart';
import 'package:teacher_finder/common/styles/styles.dart';

import 'security/presentation/login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
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
              Container(
                width: 300,
                height: 300,
                  child: Image(image: AssetImage('assets/icon/iconTF.png'))),
              SizedBox(height: 40),
              CircularProgressIndicator(
                color: Styles.secondaryColor,
              ),
            ],
          ),
        ));
  }
}
