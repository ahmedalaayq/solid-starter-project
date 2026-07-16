import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/user_email_notification_service.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/user_id_generator.dart';
import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/user_validator.dart';
import '../../2.2/good/main.dart';
import 'user_logger.dart';
import 'user_model.dart';
import 'user_repo.dart';
import 'user_service.dart';

void main() {
  final UserModel user = UserModel(
    id: generateRandomlyOrderId(),
    firstName: "Ahmed",
    lastName: "Alaayq",
    email: "ahmed.alaayq@gmail.com",
    roles: [
      "Product Owner "
          ", CEO "
          ", Software Engineer "
          ", Flutter Developer ",
    ],
  );
  final UserService userService = UserService(
    userIdGenerator: UserIdGenerator(),
    userValidator: UserValidator(),
    userRepo: UserRepo(),
    userEmailNotificationService: UserEmailNotificationService(),
    userLogger: UserLogger(),
  );
  print(userService.createUser(user));
}
