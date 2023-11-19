import 'package:flutter/material.dart';
import 'package:pharma/screens/forget_password.dart';
import 'package:pharma/screens/home.dart';
import 'package:pharma/screens/register.dart';
import 'package:pharma/widgets/rigix/forms_text_field.dart';
import 'package:pharma/widgets/rigix/rigix_text.dart';
import 'package:pharma/widgets/rigix/rounded_button.dart';
import 'package:pharma/widgets/rigix/T_button.dart';
class LoginScreen extends StatelessWidget {
    LoginScreen({super.key});
 final _formKey=GlobalKey<FormState>();
 void _onSaved(BuildContext context){
   if(_formKey.currentState!.validate()){
     _formKey.currentState!.save();
     Navigator.of(context).pushReplacement(
         MaterialPageRoute(builder: (ctx){
           return HomeScreen();
         }));
   }
 }
 void _onRegisterSelect(BuildContext context){
   Navigator.of(context).pushReplacement(
       MaterialPageRoute(builder: (ctx){
         return RegisterScreen();
       }));
 }
 void _onForgetPSelect(BuildContext context){
   Navigator.of(context).pushReplacement(
       MaterialPageRoute(builder: (ctx){
         return ForgetPasswordScreen();
       }));
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                RigixText("Login"),
                const SizedBox(height: 35,),
                FormsTextField(
                    topic: FormsTopic.phoneNumber,
                    label: "enter your phone number here"),
                const SizedBox(height: 16,),
                FormsTextField(topic: FormsTopic.password,
                    label: "enter your password here"),
                const SizedBox(height: 16,),
                RoundedButton(title: "Login",
                    onPressed: (){_onSaved(context);}),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text("Don't have an account?"),
                  TButton(
                      title: "Register now",
                      onPressed:() {_onRegisterSelect(context);})
                ],),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text("Forget your password?"),
                  TButton(
                      title: "Create New Password",
                      onPressed:() {_onForgetPSelect(context);})
                ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
