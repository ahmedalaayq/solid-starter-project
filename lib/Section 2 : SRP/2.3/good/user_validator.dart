class UserValidator {
  bool isValidEmail(String email) {
    return email.contains('@') && email.length > 5;
  }

  bool isValidName(String name) {
    return name.isNotEmpty && name.length >= 2;
  }
}
