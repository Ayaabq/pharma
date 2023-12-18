import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/screens/categories.dart';

import 'package:pharma/screens/rigex_sreens/splash.dart';


var kColorScheme =ColorScheme.fromSeed(seedColor: const Color.fromARGB(
    255, 67, 201, 201));

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData().copyWith(useMaterial3:  true,
            colorScheme: kColorScheme,
            appBarTheme: const AppBarTheme().copyWith(
              backgroundColor: kColorScheme.onPrimaryContainer,
              foregroundColor: kColorScheme.primaryContainer,

            )),
      home: Scaffold(

        body:// CategoriesScreen()
        SplashScreen()

      ),
    );
  }
}
