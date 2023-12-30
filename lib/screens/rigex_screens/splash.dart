import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharma/screens/rigex_screens/login.dart';
import 'package:pharma/screens/categories.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../providers/auth_data_provider.dart';
import '../../utils/kcolors_utils.dart';
import '../../utils/kfonts.dart';
import '../categories.dart';

class SplashScreen extends ConsumerWidget {
 SplashScreen({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
      future: _determineNextScreen(context, ref),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AnimatedSplashScreen(
            splash: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/images/pharma_logo.gif'),
                  SizedBox(
                    height: 16,
                  ),
                  GradientText(
                    "Pharma",
                    style: klogo,
                    colors: kTextGradiant,
                  )
                ],
              ),
            ),
            splashIconSize: 500,
            nextScreen: snapshot.data!,
            duration: 4000,
            splashTransition: SplashTransition.sizeTransition,
           // pageTransitionType: PageTransitionType.fade,
          );
        } else {
          // Loading state
          return CircularProgressIndicator();
        }
      },
    );
  }

  Future<Widget> _determineNextScreen(BuildContext context,WidgetRef ref) async {
    final tokenState = ref.read(tokenProvider.notifier);
    await tokenState.getToken(ref);

    if (tokenState.state != null) {
      // Token, id, and name are saved, navigate to CategoriesScreen
      return CategoriesScreen();
    } else {
      // Token, id, or name is missing, navigate to LoginScreen
      return LoginScreen();
    }
  }
}
