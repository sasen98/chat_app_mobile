extension Validation on String? {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this!);
  }

  bool get isValidName {
    final nameRegExp =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this!);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this!);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this!);
  }
}

class InputValidator {
  static String? validateConfirmPassword({
    required String? password,
    required String? confirmPassword,
  }) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "This field is required";
    }
    // if (confirmPassword.length > 2 && confirmPassword.length < 8) {
    //   return "Password should be the combination of uppercase and lowercase letter, number, special character and minimum length of 8";
    // }
    // if (!passwordReg.hasMatch(confirmPassword)) {
    //   return 'Password should be the combination of uppercase and lowercase letter, number, special character and minimum length of 8';
    // }
    if (password != confirmPassword) {
      return "Password and confirm password does not match";
    }

    return null;
  }
}
