

import 'email_service.dart';
import 'email_validator.dart';
import 'password_hash.dart';
import 'user_logger.dart';
import 'user_model.dart';
import 'user_repo.dart';

class UserManager {
  void createUser({required UserModel user}) {
    if (!EmailValidator().isValidEmail(user.email)) {
      return;
    }
    PasswordHash().hashPassword(user.password);
    UserRepo().save(user);
    EmailService().sendWelcomeEmail(user.email);
    UserLogger(user: user).logUserCreation();
    UserLogger(user:user).logUserLogin();
  }
}
