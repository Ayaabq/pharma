import 'package:flutter/material.dart';
import 'package:pharma/screens/categories.dart';
import 'package:pharma/screens/rigex_sreens/login.dart';
import 'package:pharma/services/auth_service.dart';

import '../../widgets/rigix/T_button.dart';
import '../../widgets/rigix/forms_text_field.dart';
import '../../widgets/rigix/rigix_text.dart';
import '../../widgets/rigix/rounded_button.dart';
class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
   final TextEditingController _phoneController=TextEditingController();
   final TextEditingController _userNameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
   final TextEditingController _passwordController=TextEditingController();
   final TextEditingController _confPasswordController=TextEditingController();
  final _formKey=GlobalKey<FormState>();
   void _onSaved(BuildContext context) async{
     if(_formKey.currentState!.validate()){
       _formKey.currentState!.save();
       // await AuthServices().createUser(
       //     phone: _phoneController.value.toString(),
       //     email: _emailController.value.toString(),
       //     password: _phoneController.value.toString(),
       //     userName: _userNameController.value.toString(),
       // confPassword: _confPasswordController.value.toString());


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
                    ctrl: _userNameController,
                    topic: FormsTopic.userName,
                    label: "enter your user name"),
                const  SizedBox(height: 16,),
                FormsTextField(
                  ctrl: _phoneController,
                    topic: FormsTopic.phoneNumber,
                    label: "enter your phone number here"),
               const  SizedBox(height: 16,),
                FormsTextField(
                  ctrl: _emailController,
                    topic: FormsTopic.email,
                    label: "enter your email here"),
               const  SizedBox(height: 16,),
                FormsTextField(
                   ctrl: _passwordController,
                    topic: FormsTopic.password,
                    label: "enter your password here"),
                const SizedBox(height: 16,),
                FormsTextField(
                   ctrl: _confPasswordController,
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
