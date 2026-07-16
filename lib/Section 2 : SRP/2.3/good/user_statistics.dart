import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/user_model.dart';

class UserStatistics {
  final List<UserModel> _users = [];
  int getTotalUsers() => _users.length;

    Map<String, int> getRoleStatistics() {
    Map<String, int> stats = {};
    for (var user in _users) {
      for (var role in user.roles) {
        stats[role] = (stats[role] ?? 0) + 1;
      }
    }
    return stats;
  }
}
