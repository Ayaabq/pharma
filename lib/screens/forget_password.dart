import 'package:flutter/material.dart';
import 'package:pharma/screens/login.dart';

import '../widgets/rigix/T_button.dart';
import '../widgets/rigix/forms_text_field.dart';
import '../widgets/rigix/rigix_text.dart';
import '../widgets/rigix/rounded_button.dart';
class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({super.key});
  final _formKey=GlobalKey<FormState>();
  void _onSaved(BuildContext context){
    if(_formKey.currentState!.validate()){
      _formKey.currentState!.save();
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (cts)=>LoginScreen())
      );
    }
  }
   void _onLoginSelect(BuildContext context){
     Navigator.of(context).pushReplacement(
         MaterialPageRoute(builder: (ctx){
           return  LoginScreen();
         }));
   }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                RigixText("Forget Password"),
                const SizedBox(height: 35,),
                FormsTextField(
                    topic: FormsTopic.phoneNumber,
                    label: "enter your phone number here"),
                const SizedBox(height: 16,),
                FormsTextField(topic: FormsTopic.password,
                    label: "enter your password here"),
                const SizedBox(height: 16,),
                RoundedButton(title: "Confirm",
                    onPressed: (){_onSaved(context);}),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    TButton(
                        title: "Login now",
                        onPressed: (){_onLoginSelect(context);})
                  ],)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
