class EmailValidator {
  bool isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }
}

extension EmailValidatorEx on String {
  bool isValidEmail() {
    return contains('@') && contains('.');
  }
}
