import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pharma/models/user.dart';

// sate notifier is a generic class we all the <>...
class UserNotifier extends StateNotifier<User?> {
  // we add all the initial value
  //and all the methods we want to ably on it

  // pass the initial data:
  UserNotifier() : super(null);

  setUser(User user) {
    state = user;
  }
}

final userProvider = StateNotifierProvider<UserNotifier, User?>((ref) {
  return UserNotifier();
});
