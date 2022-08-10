class NinjaStringValidator {
  static bool validateStringRange(String text,
      [int minLength = 0, int maxLength = 10]) {
    return text.length >= minLength && text.length <= maxLength;
  }

  static bool isEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{1,}))$';
    RegExp regex = RegExp(pattern as String);
    return regex.hasMatch(email);
  }

  static bool isAcademicGroup(String group) {
    RegExp regex = RegExp(r"^[А-Я]{4}-[0-9]{2}-[0-9]{2}$");
    return regex.hasMatch(group);
  }
}
