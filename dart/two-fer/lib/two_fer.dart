String twoFer([String name = ""]) {
  // Replace the throw call and put your code here
  final String trimmed = name.trim();
  if (trimmed == "") {
    return "One for you, one for me.";
  }
  return "One for $trimmed, one for me.";
}
