import 'user_model.dart';

class UserRepo {
    final List<UserModel> _users = [];
  void save(UserModel user) {
    print("Saving ${_users.length} users to file....");
  }

    UserModel? getUserById(String id) {
    try {
      return _users.firstWhere((user) => user.id == id);
    } catch (e) {
      return null;
    }
  }

    List<UserModel> searchUsers(String term) {
    return _users
        .where(
          (user) => user.firstName.contains(term) || user.email.contains(term),
        )
        .toList();
  }
}
