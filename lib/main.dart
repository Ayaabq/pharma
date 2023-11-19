import 'package:flutter/material.dart';
import 'package:pharma/screens/login.dart';
import 'package:pharma/screens/register.dart';
import 'package:pharma/widgets/rigix/T_button.dart';
import 'package:pharma/widgets/rigix/forms_text_field.dart';
import 'package:pharma/widgets/rigix/rounded_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _eformKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        body:RegisterScreen()
    //     Column(mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Form(
    //           key: _eformKey,
    //           child: Column
    //        ( children:
    //           [FormsTextField(topic: FormsTopic.email, label: "inter ur emil",),
    //         SizedBox(height: 29,),
    //
    //       ]
    //   ),),
    //
    //      RoundedButton(title: "save",  onPressed: (){
    //        _eformKey.currentState!.validate();
    //      }),
    //         TButton(title: "regester", onPressed: (){})
    // ],
    //     ),
      ),
    );
  }
}
