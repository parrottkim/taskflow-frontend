class Validation {
  static bool isUsernameValid(String text) {
    return RegExp(r'^[가-힣]{2,}$').hasMatch(text);
  }

  static bool isEmailValid(String text) {
    return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(text);
  }

  static bool isPasswordValid(String text) {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%^&*()]).{8,}$')
        .hasMatch(text);
  }
}
