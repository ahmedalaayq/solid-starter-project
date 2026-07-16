import 'user_email_notification_service.dart';
import 'user_id_generator.dart';
import 'user_logger.dart';
import 'user_model.dart';
import 'user_repo.dart';
import 'user_validator.dart' ;

class UserService {
  UserService({
    required UserIdGenerator userIdGenerator,
    required UserValidator userValidator,
    required UserRepo userRepo,
    required UserEmailNotificationService userEmailNotificationService,
    required UserLogger userLogger,
  }) : _userIdGenerator = userIdGenerator,
       _userValidator = userValidator,
       _userRepo = userRepo,
       _userEmailNotificationService = userEmailNotificationService,
       _userLogger = userLogger;
  final UserIdGenerator _userIdGenerator;
  final UserValidator _userValidator;
  final UserRepo _userRepo;
  final UserEmailNotificationService _userEmailNotificationService;
  final UserLogger _userLogger;

  final List<UserModel> _users = [];
  UserModel createUser(
  UserModel user
  ) {
    final id = _userIdGenerator.generateId();

    if (!_userValidator.isValidName(user.firstName) ||
        !_userValidator.isValidName(user.lastName) ||
        !_userValidator.isValidEmail(user.email)) {
      throw Exception('Invalid user data');
    }

    _users.add(user);
    _userRepo.save(user);

    _userEmailNotificationService.sendWelcomeEmail(user);

    _userLogger.logUserCreation(user);

    return user;
  }
}
