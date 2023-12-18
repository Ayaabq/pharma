import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterController {
  static TextEditingController phoneController = TextEditingController();
  static TextEditingController userNameController = TextEditingController();
  static TextEditingController emailController = TextEditingController();
  static TextEditingController passwordController = TextEditingController();
  static TextEditingController confPasswordController = TextEditingController();
}

final registerControllerProvider =
    Provider<RegisterController>((ref) => RegisterController());
