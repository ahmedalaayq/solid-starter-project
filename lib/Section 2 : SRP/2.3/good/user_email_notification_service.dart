import 'package:solid_examples/Section%202%20:%20SRP/2.3/good/user_model.dart';

class UserEmailNotificationService 
{
  void sendWelcomeEmail(UserModel user) {
    print('📧 Sending welcome email to ${user.email}');
    print('Subject: Welcome ${user.firstName}!');
  }
}