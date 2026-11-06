// I surrendered. I use AI to solve this
class Forth {
  final List<int> _stack = [];

  /// User-defined words: name → expanded token body, captured at definition time.
  final Map<String, List<String>> _words = {};

  /// Built-in words: name → function that operates on the stack.
  final Map<String, void Function()> _builtins = {};

  Forth() {
    _builtins.addAll({
      '+': () => _binary((a, b) => a + b),
      '-': () => _binary((a, b) => a - b),
      '*': () => _binary((a, b) => a * b),
      '/': () => _binary((a, b) {
            if (b == 0) throw Exception('Division by zero');
            return a ~/ b;
          }),
      'dup': () {
        _require(1);
        _stack.add(_stack.last);
      },
      'drop': () {
        _require(1);
        _stack.removeLast();
      },
      'swap': () {
        _require(2);
        final b = _stack.removeLast();
        final a = _stack.removeLast();
        _stack
          ..add(b)
          ..add(a);
      },
      'over': () {
        _require(2);
        _stack.add(_stack[_stack.length - 2]);
      },
    });
  }

  List<int> get stack => List<int>.unmodifiable(_stack);

  void evaluate(String input) {
    final tokens = input
        .toLowerCase()
        .split(RegExp(r'\s+'))
        .where((t) => t.isNotEmpty)
        .toList();
    _execute(tokens);
  }

  // ---------------------------------------------------------------------------
  // Token loop: handles ": name body ;" definitions and normal execution.
  // ---------------------------------------------------------------------------
  void _execute(List<String> tokens) {
    var i = 0;
    while (i < tokens.length) {
      if (tokens[i] == ':') {
        final end = tokens.indexOf(';', i);
        if (end == -1) throw Exception('Invalid definition');
        _define(tokens[i + 1], tokens.sublist(i + 2, end));
        i = end + 1;
      } else {
        _run(tokens[i]);
        i++;
      }
    }
  }

  // ---------------------------------------------------------------------------
  // Define a user word. Expand existing words NOW (definition-time capture)
  // so a word's body sees the previous definition, not itself.
  // ---------------------------------------------------------------------------
  void _define(String name, List<String> body) {
    if (int.tryParse(name) != null) {
      throw Exception('Invalid definition'); // cannot redefine numbers
    }

    final expanded = <String>[];
    for (final token in body) {
      final userDef = _words[token];
      if (userDef != null) {
        expanded.addAll(userDef); // inline the current body
      } else {
        expanded.add(token); // number or built-in keyword
      }
    }
    _words[name] = expanded; // overrides any previous definition
  }

  // ---------------------------------------------------------------------------
  // Run a single token. Lookup order matters: user words BEFORE built-ins,
  // so `: swap dup ;` overrides the built-in swap.
  // ---------------------------------------------------------------------------
  void _run(String token) {
    final n = int.tryParse(token);
    if (n != null) {
      _stack.add(n);
      return;
    }

    final userDef = _words[token];
    if (userDef != null) {
      _execute(userDef);
      return;
    }

    final builtin = _builtins[token];
    if (builtin != null) {
      builtin();
      return;
    }

    throw Exception('Unknown command');
  }

  // ---------------------------------------------------------------------------
  // Helpers
  // ---------------------------------------------------------------------------
  void _require(int n) {
    if (_stack.length < n) throw Exception('Stack empty');
  }

  void _binary(int Function(int, int) op) {
    _require(2);
    final b = _stack.removeLast();
    final a = _stack.removeLast();
    _stack.add(op(a, b)); // a op b — operand order matters for - and /
  }
}
