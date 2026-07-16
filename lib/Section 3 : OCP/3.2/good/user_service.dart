import 'package:solid_examples/Section%206%20:%20DIP/6.2.1/user_manager.dart';

class UserService {
  final Logger _logger;

  UserService(this._logger);

  void createUser(String username) {
    print('Creating user: $username');

    _logger.log('User created: $username');
  }

  void deleteUser(String username) {
    print('Deleting user: $username');
    _logger.log('User deleted: $username');
  }
}
