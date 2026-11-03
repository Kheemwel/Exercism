import 'dart:math' as math;

class HighScores {
  // Put your code here
  final List<int> scores;

  HighScores(this.scores);

  int latest() => scores.last;

  int personalBest() => scores.reduce(math.max);

  List<int> personalTopThree() {
    const int topCount = 3;
    final sorted = [...scores]..sort((a, b) => b.compareTo(a)); // desc
    return sorted.take(topCount).toList();
  }
}
