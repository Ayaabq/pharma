import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/services/auth_service.dart';
import 'package:pharma/models/user.dart';
import 'package:pharma/screens/rigex_sreens/register.dart';
import '../models/rigex/register.dart';




  final registerDataProvider = FutureProvider<RegisterModel>((ref,) async {
    return await ref.watch(authProvider).createUser(registerModel);
  });

// final loginDataProvider = FutureProvider<LoginModel>((ref,) async {
//   return await ref.watch(authProvider).getUser(registerModel);
// });
