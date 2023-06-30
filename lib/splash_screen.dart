import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:teacher_finder/common/styles/styles.dart';
import 'security/presentation/login/login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('assets/icon/iconTF.png'),
      splashIconSize: 300,
      nextScreen: const LoginScreen(),
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: Styles.primaryColor,
      duration: 2000,
      curve: Curves.easeInOut,
      //splashTransitionDuration: const Duration(milliseconds: 800),
    );
  }
}
