import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';import 'package:pharma/screens/rigex_sreens/login.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pharma/utils/kfonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../utils/kcolors_utils.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
           Image.asset('assets/images/pharma_logo.gif') ,
          SizedBox(height: 16,),
          GradientText(
          "Pharma",
          style: klogo,
          colors: kTextGradiant,
    )
          ],
        ),
      ),
      splashIconSize: 500,

      nextScreen: LoginScreen(),
      duration: 4000,
      splashTransition: SplashTransition.sizeTransition,
      pageTransitionType: PageTransitionType.fade,


    );
  }
}
