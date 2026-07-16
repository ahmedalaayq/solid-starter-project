
import 'email_service.dart';
import 'email_validator.dart';
import 'password_hash.dart';
import 'user_creation_service.dart';
import 'user_logger.dart';
import 'user_model.dart';
import 'user_repo.dart';

void main() async {
  final UserModel user = UserModel(
    name: 'ahmed alaayq',
    email: 'ahmed.alaayq@gmail.com',
    password: 'Ahmed123@',
  );
  UserCreationService manager = UserCreationService(
    emailValidator: EmailValidator(),
    userRepo: UserRepo(),
    hashPassword: PasswordHash(),
    emailService: EmailService(),
    userLogger: UserLogger(
      user: user
    ),
  );
  manager.createUser(user);
  final String email = 'ahmed.alaayq@';
  
  print(email.isValidEmail());
}
