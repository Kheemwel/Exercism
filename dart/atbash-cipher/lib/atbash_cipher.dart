// My code
// class AtbashCipher {
//   final String letters = 'abcdefghijklmnopqrstuvwxyz';
//   final String cipher = 'zyxwvutsrqponmlkjihgfedcba';

//   String encode(String word) {
//     String encoded = '';
//     int lettersBeforeSpace = 0;
//     for (String char in word.toLowerCase().split('')) {
//       if (!RegExp(r'^[a-zA-Z0-9]$').hasMatch(char)) continue;

//       if (lettersBeforeSpace == 5) {
//         encoded += ' ';
//         lettersBeforeSpace = 0;
//       }

//       if (cipher.contains(char)) {
//         encoded += cipher[letters.indexOf(char)];
//       } else {
//         encoded += char;
//       }

//       lettersBeforeSpace++;
//     }
//     return encoded;
//   }

//   String decode(String word) {
//     String decoded = '';
//     for (String char in word.toLowerCase().split('')) {
//       if (!RegExp(r'^[a-zA-Z0-9]$').hasMatch(char)) continue;
//       if (letters.contains(char)) {
//         decoded += cipher[letters.indexOf(char)];
//       } else {
//         decoded += char;
//       }
//     }
//     return decoded;
//   }
// }

// Using StringBuffer and Character Code
class AtbashCipher {
  static const _chunk = 5;

  String encode(String word) {
    final buf = StringBuffer();
    var count = 0;

    for (final c in word.toLowerCase().codeUnits) {
      final isDigit = c >= 0x30 && c <= 0x39;
      final isLetter = c >= 0x61 && c <= 0x7A;
      if (!isDigit && !isLetter) continue;

      if (count > 0 && count % _chunk == 0) buf.write(' ');
      buf.writeCharCode(isLetter ? 0x61 + 0x7A - c : c);
      count++;
    }
    return buf.toString();
  }

  String decode(String word) {
    final buf = StringBuffer();
    for (final c in word.toLowerCase().codeUnits) {
      if (c >= 0x61 && c <= 0x7A) {
        buf.writeCharCode(0x61 + 0x7A - c);
      } else if (c >= 0x30 && c <= 0x39) {
        buf.writeCharCode(c);
      }
      // everything else (spaces, punctuation) dropped
    }
    return buf.toString();
  }
}
