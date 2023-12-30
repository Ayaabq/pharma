import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/providers/user_provider.dart';
import 'package:pharma/services/auth_service.dart';
import 'package:pharma/models/user.dart';
import 'package:pharma/screens/rigex_screens/register.dart';
import '../models/rigex/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

final registerDataProvider = FutureProvider<RegisterModel?>((
  ref,
) async {
  return await ref!.watch(authProvider!).createUser!(registerModel!);
});

class TokenNotifierState extends StateNotifier<String?> {
  TokenNotifierState() : super(null);

  Future<void> setToken(String token, int id, String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = token;

    prefs.setString("token", token);
    prefs.setInt("id", id);
    prefs.setString("name", name);

  }

  Future<void> getToken(WidgetRef ref) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = prefs.getString("token");
    var name = prefs.getString("name");
    var id = prefs.getInt("id");

    ref.watch(userProvider.notifier).setUser(User(id: id, name: name));
    //ref.watch(FCMTokenProvider.notifier).setFCM(fCM!);
  }

  Future<void> deleteToken(WidgetRef ref) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    ref.watch(userProvider.notifier).setUser(User());
    state = null;
  }

  Future<bool> areTokenAndUserInfoSaved() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("token") &&
        prefs.containsKey("id") &&
        prefs.containsKey("name");
  }
}

final tokenProvider = StateNotifierProvider((ref) => TokenNotifierState());





class FCMTokenNotifierState extends StateNotifier<String?> {
  FCMTokenNotifierState() : super(null);

  setFCM(String fCM) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = fCM;
    prefs.setString("fcm_token", fCM);
  }
}

final FCMTokenProvider = StateNotifierProvider((ref) => FCMTokenNotifierState());


// class UsreNotifierState extends StateNotifier<int?> {
//   UsreNotifierState() : super(null);
//
//   setToken( int id) async{
//     SharedPreferences prefs= await SharedPreferences.getInstance();
//     state = token;
//     prefs.setString("token", token);
//   }
//   getToken() async{
//     SharedPreferences prefs= await SharedPreferences.getInstance();
//   }
// }
//
// final userProvider = StateNotifierProvider((ref) => TokenNotifierState());
