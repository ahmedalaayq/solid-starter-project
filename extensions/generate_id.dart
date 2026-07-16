import 'dart:math';

extension IdGenerator on String {
  String generateRandomlyId() {
    String chars = "ABCDEFGHJKMNPQRSTUVWXYZ23456789";
    final Random random = Random.secure();
    String value = '';
    for (int i = 0; i < 6; i++) {
      value += chars[random.nextInt(chars.length)];
    }
    return value;
  }
}
