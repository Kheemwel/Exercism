class Etl {
  // Put your code here
  Map<String, int> transform(Map<String, List<String>> legacy) {
    return <String, int>{
      for (final score in legacy.entries)
        for (final letter in score.value)
          letter.toLowerCase(): int.tryParse(score.key) ?? 0
    };
  }
}
