import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';import 'package:pharma/screens/rigex_sreens/login.dart';
import 'package:page_transition/page_transition.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/PHARMACY LOGO .png',
      splashIconSize: 300,
      backgroundColor: Colors.purple[50]!,
      nextScreen: LoginScreen(),
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.fade,

    );
  }
}
