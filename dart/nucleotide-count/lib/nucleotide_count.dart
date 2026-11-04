class InvalidNucleotideException implements Exception {
  const InvalidNucleotideException();

  @override
  String toString() => 'Invalid Nucleotide';
}

class NucleotideCount {
  Map<String, int> count(String strand) {
    if (!RegExp(r'^[ACGT]*$').hasMatch(strand)) {
      throw InvalidNucleotideException();
    }
    final Map<String, int> nucleotides = {'A': 0, 'C': 0, 'G': 0, 'T': 0};
    for (String char in strand.split('')) {
      nucleotides[char] = nucleotides[char]! + 1;
    }
    return nucleotides;
  }
}
