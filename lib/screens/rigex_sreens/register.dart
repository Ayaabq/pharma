import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/models/rigex/register.dart';
import 'package:pharma/screens/categories.dart';
import 'package:pharma/screens/rigex_sreens/login.dart';
import 'package:pharma/services/auth_service.dart';
import '../../controllers/register_controllers.dart';
import '../../models/user.dart';
import '../../providers/auth_data_provider.dart';
import '../../providers/user_provider.dart';
import '../../widgets/rigix/T_button.dart';
import '../../widgets/rigix/forms_text_field.dart';
import '../../widgets/rigix/rigix_text.dart';
import '../../widgets/rigix/rounded_button.dart';
late RegisterModel registerModel;

class RegisterScreen extends ConsumerWidget {
   RegisterScreen({super.key});
   // controllers for the filed




  // the form key
   final _formKey=GlobalKey<FormState>();
  late RegisterModel watcher;
   // this function will execute when the register button pressed
   void _onSaved(BuildContext context, WidgetRef ref) async{
   //check the validation
     if(_formKey.currentState!.validate()){
       _formKey.currentState!.save();
       // making the api model to use it for connecting with baackend

        registerModel=RegisterModel(user:User(phone: RegisterController.phoneController.text.toString(),
           email: RegisterController.emailController.text.toString(),
           password: RegisterController.passwordController.text.toString(),
           name: RegisterController.userNameController.text.toString(),
         ));


       // calling the api function
         final _userWatcher=  await ref.read(registerDataProvider);

     //   _userWatcher.when(data: (data){
     //
     //  },
     //       error: (err, s)=> Text(err.toString()),
     //       loading: ()=>showDialog(context: context, builder: (ctx)=> CircularProgressIndicator()),
     //
     // );
       ref.watch(userProvider.notifier).setUser(_userWatcher.value!.user!);


       //  await AuthServices().createUser(registerModel);
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
  Widget build(BuildContext context, WidgetRef ref) {


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
                    ctrl: RegisterController.userNameController,
                    topic: FormsTopic.userName,
                    label: "enter your user name"),
                const  SizedBox(height: 16,),
                FormsTextField(
                  ctrl: RegisterController.phoneController,
                    topic: FormsTopic.phoneNumber,
                    label: "enter your phone number here"),
               const  SizedBox(height: 16,),
                FormsTextField(
                  ctrl: RegisterController.emailController,
                    topic: FormsTopic.email,
                    label: "enter your email here"),
               const  SizedBox(height: 16,),
                FormsTextField(
                   ctrl: RegisterController.passwordController,
                    topic: FormsTopic.password,
                    label: "enter your password here"),
                const SizedBox(height: 16,),
                FormsTextField(
                   ctrl: RegisterController.confPasswordController,
                    topic: FormsTopic.confirmPassword,
                    label: "enter your password here"),
                const SizedBox(height: 16,),
                RoundedButton(title: "Regist",
                    onPressed: (){_onSaved(context,ref);}),
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
