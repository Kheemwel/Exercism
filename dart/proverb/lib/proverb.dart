class Proverb {
  String recite(List<String> pieces) {
    final int piecesCount = pieces.length;

    if (piecesCount <= 0) return '';
    final StringBuffer result = StringBuffer();

    for (int index = 0; index < piecesCount; index++) {
      if (index == piecesCount - 1) {
        result.write('And all for the want of a ${pieces[0]}.');
      } else {
        result.writeln(
            'For want of a ${pieces[index]} the ${pieces[index + 1]} was lost.');
      }
    }

    return result.toString();
  }
}
