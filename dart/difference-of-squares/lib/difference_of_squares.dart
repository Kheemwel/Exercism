class DifferenceOfSquares {
  int squareOfSum(int number) {
    int sum = 0;
    for (int n = 1; n <= number; n++) {
      sum += n;
    }
    return sum * sum;
  }

  int sumOfSquares(int number) {
    int sum = 0;
    for (int n = 1; n <= number; n++) {
      sum += n * n;
    }
    return sum;
  }

  int differenceOfSquares(int number) {
    return squareOfSum(number) - sumOfSquares(number);
  }
}
