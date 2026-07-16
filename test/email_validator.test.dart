import 'dart:developer';

void testValidator() {
  assert(sum(2, 2) == 4);
}

int sum(int a, int b) {
  return a + b;
}

void main() {
  testValidator();
}
