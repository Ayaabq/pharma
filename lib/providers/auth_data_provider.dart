import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/services/auth_service.dart';
import 'package:pharma/models/user.dart';
import 'package:pharma/screens/rigex_screens/register.dart';
import '../models/rigex/register.dart';

final registerDataProvider = FutureProvider<RegisterModel?>((
  ref,
) async {
  return await ref!.watch(authProvider!).createUser!(registerModel!);
});

class TokenNotifierState extends StateNotifier<String?> {
  TokenNotifierState() : super(null);

  setToken(String token) {
    state = token;
  }
}

final tokenProvider = StateNotifierProvider((ref) => TokenNotifierState());
