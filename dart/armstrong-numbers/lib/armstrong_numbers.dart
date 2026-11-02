class ArmstrongNumbers {
  // Put your code here
  bool isArmstrongNumber(String number) {
    final List<BigInt> numbers = number.split('').map(BigInt.parse).toList();
    final int numbersLength = numbers.length;
    BigInt total = BigInt.zero;
    for (final BigInt num in numbers) {
      total += num.pow(numbersLength);
    }
    return total.toString() == number;
  }
}
