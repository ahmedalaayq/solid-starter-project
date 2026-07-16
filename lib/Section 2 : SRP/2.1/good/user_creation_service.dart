
import 'email_service.dart';
import 'email_validator.dart';
import 'password_hash.dart';
import 'user_logger.dart';
import 'user_model.dart';
import 'user_repo.dart';

class UserCreationService {
  UserCreationService({
    required EmailValidator emailValidator,
    required UserRepo userRepo,
    required PasswordHash hashPassword,
    required EmailService emailService,
    required UserLogger userLogger,
  }) : _userLogger = userLogger,
       _emailService = emailService,
       _hashPassword = hashPassword,
       _userRepo = userRepo,
       _emailValidator = emailValidator;
  final EmailValidator _emailValidator;
  final UserRepo _userRepo;
  final PasswordHash _hashPassword;
  final EmailService _emailService;
  final UserLogger _userLogger;

  void createUser(UserModel user) {
    if (!_emailValidator.isValidEmail(user.email)) return;

    _hashPassword.hashPassword(user.password);
    _userRepo.save(user);
    _emailService.sendWelcomeEmail(user.email);
    _userLogger.logUserCreation();
  }
}
