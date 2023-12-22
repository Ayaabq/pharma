
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/models/rigex/register.dart';
import 'package:pharma/screens/categories.dart';
import 'package:pharma/screens/rigex_screens/login.dart';
import 'package:pharma/services/auth_service.dart';
import '../../controllers/register_controllers.dart';
import '../../data/error_message.dart';
import '../../models/user.dart';
import '../../providers/auth_data_provider.dart';
import '../../providers/user_provider.dart';
import '../../widgets/rigix/T_button.dart';
import '../../widgets/rigix/rigix_text_field.dart';
import '../../widgets/rigix/rigix_text.dart';
import '../../widgets/rigix/rounded_button.dart';

late RegisterModel registerModel;

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});
  // controllers for the filed

  // the form key
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late RegisterModel watcher;
  // this function will execute when the register button pressed
  void _showErrorSnackBar(BuildContext context, String content) {
    final snackBar = SnackBar(
      content: Text(content),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {
          // Perform any additional action if needed
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void _onSaved(BuildContext context, WidgetRef ref) async {
    //check the validation
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // making the api model to use it for connecting with baackend

      registerModel = RegisterModel(
          user: User(
        phone: RegisterController.phoneController.text.toString(),
        email: RegisterController.emailController.text.toString(),
        password: RegisterController.passwordController.text.toString(),
        name: RegisterController.userNameController.text.toString(),
      ));

      // calling the api function
      final _authWatcher =
          await ref.watch(authProvider).createUser(registerModel);

    if(error==null){
      ref.watch(userProvider.notifier).setUser(_authWatcher!.user!);
      ref.watch(tokenProvider.notifier).setToken(_authWatcher.token!);
      //  await AuthServices().createUser(registerModel);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return const CategoriesScreen();
      }));
    }
      print("from scren $error");
        if(error!=null){
          print(error);
          _showErrorSnackBar(context, error!);
          error =null;
        }

    }
  }

  void _onLoginSelect(BuildContext context) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return LoginScreen();
    }));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RigixText("Register"),
                  const SizedBox(
                    height: 35,
                  ),
                  RigixTextField(
                      ctrl: RegisterController.userNameController,
                      topic: FormsTopic.userName,
                      label: "enter your user name"),
                  const SizedBox(
                    height: 16,
                  ),
                  RigixTextField(
                      ctrl: RegisterController.phoneController,
                      topic: FormsTopic.phoneNumber,
                      label: "enter your phone number here"),
                  const SizedBox(
                    height: 16,
                  ),
                  RigixTextField(
                      ctrl: RegisterController.emailController,
                      topic: FormsTopic.email,
                      label: "enter your email here"),
                  const SizedBox(
                    height: 16,
                  ),
                  RigixTextField(
                      ctrl: RegisterController.passwordController,
                      topic: FormsTopic.password,
                      label: "enter your password here"),
                  const SizedBox(
                    height: 16,
                  ),
                  RigixTextField(
                      ctrl: RegisterController.confPasswordController,
                      topic: FormsTopic.confirmPassword,
                      label: "enter your password here"),
                  const SizedBox(
                    height: 16,
                  ),
                  RoundedButton(
                      title: "Regist",
                      onPressed: () {
                        _onSaved(context, ref);
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TButton(
                          title: "Login now",
                          onPressed: () {
                            _onLoginSelect(context);
                          })
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
