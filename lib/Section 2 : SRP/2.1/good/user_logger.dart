

import 'user_model.dart';

class UserLogger {
  UserLogger({required this.user});
  final UserModel user;

  void logUserCreation() {
    print('LOG: User ${user.name} created at ${DateTime.now()}');
  }

  void logUserLogin() {
    print('LOG: User ${user.email} Logged in : ${DateTime.now()}');
  }
}
