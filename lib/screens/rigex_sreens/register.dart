import 'package:flutter/material.dart';
import 'package:pharma/models/rigex/register.dart';
import 'package:pharma/screens/categories.dart';
import 'package:pharma/screens/rigex_sreens/login.dart';
import 'package:pharma/services/auth_service.dart';
import '../../widgets/rigix/T_button.dart';
import '../../widgets/rigix/forms_text_field.dart';
import '../../widgets/rigix/rigix_text.dart';
import '../../widgets/rigix/rounded_button.dart';
class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
   // controllers for the filed
   final TextEditingController _phoneController=TextEditingController();
   final TextEditingController _userNameController=TextEditingController();
  final TextEditingController _emailController=TextEditingController();
   final TextEditingController _passwordController=TextEditingController();
   final TextEditingController _confPasswordController=TextEditingController();



  // the form key
   final _formKey=GlobalKey<FormState>();


   // this function will execute when the register button pressed
   void _onSaved(BuildContext context) async{
   //check the validation
     if(_formKey.currentState!.validate()){
       _formKey.currentState!.save();
       // making the api model to use it for connecting with baackend
       RegisterModel registerModel=RegisterModel(phone: _phoneController.text.toString(),
           email: _emailController.text.toString(),
           password: _passwordController.text.toString(),
           name: _userNameController.text.toString(),
           passwordConfirmation: _confPasswordController.text.toString());

       // calling the api function
       await AuthServices().createUser(registerModel);


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
