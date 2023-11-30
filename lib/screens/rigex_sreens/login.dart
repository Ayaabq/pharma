import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pharma/screens/categories.dart';
import 'package:pharma/screens/rigex_sreens/forget_password.dart';
import 'package:pharma/screens/rigex_sreens/register.dart';
import 'package:pharma/widgets/rigix/forms_text_field.dart';
import 'package:pharma/widgets/rigix/rigix_text.dart';
import 'package:pharma/widgets/rigix/rounded_button.dart';
import 'package:pharma/widgets/rigix/T_button.dart';
import 'package:http/http.dart' as http;
import '../../data/rigex.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  var phoneCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  void _onSaved(BuildContext context)  async{

    // final url= Uri.parse("http://10.0.2.2:8000/api/register");
    // final response = await http.post(url,
    //   headers: <String, String>{
    //     'Accept': 'application/json',
    //     'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
    //     'Content-Type': 'application/json',
    //   },
    //   body: json.encode(
    //       {
    //         'name': 'ayaba',
    //         'phone': '0966381871',
    //         'email': "ayabakl@gmail.com",
    //         'password': '1234567gjkh',
    //         'password_confirmation': '1234567gjkh',
    //
    //       }
    //   ),
   //  );
   //
   // print(response.statusCode);

    if (_formKey.currentState!.validate()) {
      if(users.where((user) {
        if(user.phoneNumber == phoneCtrl.value && user.password == passwordCtrl.value)
          return true;
        return false;}
      ).toList().length<1)
        print("no");
      _formKey.currentState!.save();
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return const CategoriesScreen();
        //return HomeScreen();
      }));
    }}



  void _onRegisterSelect(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return RegisterScreen();
    }));
  }

  void _onForgetPSelect(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RigixText("Login"),
                    Image.asset("assets/images/pharma_logo.png",
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 35,
                ),
                FormsTextField(
                  ctrl: phoneCtrl,
                    topic: FormsTopic.phoneNumber,
                    label: "enter your phone number here"),
                const SizedBox(
                  height: 16,
                ),
                FormsTextField(
                  ctrl: passwordCtrl,
                    topic: FormsTopic.password,
                    label: "enter your password here"),
                const SizedBox(
                  height: 16,
                ),
                RoundedButton(
                    title: "Login",
                    onPressed: () {
                      _onSaved(context);
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TButton(
                        title: "Register now",
                        onPressed: () {
                          _onRegisterSelect(context);
                        })
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Forget your password?"),
                    TButton(
                        title: "Create New Password",
                        onPressed: () {
                          _onForgetPSelect(context);
                        })
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
