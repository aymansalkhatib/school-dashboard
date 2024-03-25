import 'dart:math';

int generateUniqueNumber() {
  const min = 100000000;
  const max = 999999999;
  final Random random = Random();
  int randomNumber = min + random.nextInt(max - min);
  return randomNumber;
}
