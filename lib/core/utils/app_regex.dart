class AppRegex {
  static RegExp onlynumbers = RegExp(r'\d+');
  static RegExp onlyUppercase = RegExp(r'[A-Z]');
  static RegExp onlyLowercase = RegExp(r'[a-z]');
  static RegExp onlySpecialCharacter = RegExp(r'[^\w\s]');
}
