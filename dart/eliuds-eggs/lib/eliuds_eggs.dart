class EggCounter {
  // Your code goes here.

  int count(int eggs) {
    String binary = eggs.toRadixString(2);
    // another version
    // return eggs.toRadixString(2).replaceAll('0', '').length;
    return binary.split('').where((c) => c == '1').length;
  }
}
