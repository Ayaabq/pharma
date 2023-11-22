import 'package:flutter/material.dart';
import 'package:pharma/screens/categories.dart';
import 'package:pharma/screens/rigex_sreens/login.dart';

import '../../widgets/rigix/T_button.dart';
import '../../widgets/rigix/forms_text_field.dart';
import '../../widgets/rigix/rigix_text.dart';
import '../../widgets/rigix/rounded_button.dart';
class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  final _formKey=GlobalKey<FormState>();
   void _onSaved(BuildContext context){
     if(_formKey.currentState!.validate()){
       _formKey.currentState!.save();
       Navigator.of(context).pushReplacement(
           MaterialPageRoute(builder: (ctx){
             return const CategoriesScreen();
           }));
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
                RigixText("Register"),
                const SizedBox(height: 35,),
                FormsTextField(
                  ctrl: TextEditingController(),
                    topic: FormsTopic.phoneNumber,
                    label: "enter your phone number here"),
               const  SizedBox(height: 16,),
                FormsTextField(
                  ctrl: TextEditingController(),
                    topic: FormsTopic.email,
                    label: "enter your email here"),
               const  SizedBox(height: 16,),
                FormsTextField(
                   ctrl: TextEditingController(),
                    topic: FormsTopic.password,
                    label: "enter your password here"),
                const SizedBox(height: 16,),
                FormsTextField(
                   ctrl: TextEditingController(),
                    topic: FormsTopic.confirmPassword,
                    label: "enter your password here"),
                const SizedBox(height: 16,),
                RoundedButton(title: "Regist",
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
