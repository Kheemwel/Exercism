// Put your code here

// My code
// Map<int, List<String>> scoreSheet = {
//   1: ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'],
//   2: ['d', 'g'],
//   3: ['b', 'c', 'm', 'p'],
//   4: ['f', 'h', 'v', 'w', 'y'],
//   5: ['k'],
//   8: ['j', 'x'],
//   10: ['q', 'z'],
// };

// int score(String word) {
//   int points = 0;

//   for (String letter in word.split('')) {
//     scoreSheet.forEach((key, value) {
//       if (value.contains(letter.toLowerCase())) {
//         points += key;
//       }
//     });
//   }

//   return points;
// }

// Optimized version?
const Map<String, int> letterScores = {
  'a': 1,
  'e': 1,
  'i': 1,
  'o': 1,
  'u': 1,
  'l': 1,
  'n': 1,
  'r': 1,
  's': 1,
  't': 1,
  'd': 2,
  'g': 2,
  'b': 3,
  'c': 3,
  'm': 3,
  'p': 3,
  'f': 4,
  'h': 4,
  'v': 4,
  'w': 4,
  'y': 4,
  'k': 5,
  'j': 8,
  'x': 8,
  'q': 10,
  'z': 10,
};

int score(String word) {
  int points = 0;
  for (final letter in word.toLowerCase().split('')) {
    points += letterScores[letter] ?? 0;
  }
  return points;
}

// I like this
// const Map<int, List<String>> _groups = {
//   1: ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'],
//   2: ['d', 'g'],
//   3: ['b', 'c', 'm', 'p'],
//   4: ['f', 'h', 'v', 'w', 'y'],
//   5: ['k'],
//   8: ['j', 'x'],
//   10: ['q', 'z'],
// };

// final Map<String, int> letterScores = {
//   for (final entry in _groups.entries)
//     for (final letter in entry.value) letter: entry.key,
// };

// int score(String word) {
//   int points = 0;
//   for (final letter in word.toLowerCase().split('')) {
//     points += letterScores[letter] ?? 0;
//   }
//   return points;
// }
