class InputValidatorService {
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

  static String? validateName({required String? name}) {
    final RegExp nameRegExp = RegExp('[a-zA-Z]');
    if (name == null || name.isEmpty) {
      return "This field is required";
    }
    if (!nameRegExp.hasMatch(name)) {
      return "Invalid Input";
    }
    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null || password.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  static String? validateEmail({required String? email}) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (email == null || email.isEmpty) {
      return "This field is required";
    }
    if (!emailRegExp.hasMatch(email)) {
      return 'Invalid Email';
    }
    return null;
  }
}
