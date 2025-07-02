class Validator {
  // ✅ Email Validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email is Required";
    }

    // Corrected regex
    final emailRegExp = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");

    if (!emailRegExp.hasMatch(value)) {
      return "Invalid email address";
    }
    return null;
  }

  // ✅ Empty Field Validator
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value?.trim() == null || value!.trim().isEmpty) {
      return "$fieldName is Required";
    }
    return null;
  }

  // ✅ Password Validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is Required";
    }
    if (value.length < 6) {
      return "Password must be at least 6 characters long";
    }
    if (!value.contains(RegExp(r"[A-Z]"))) {
      return "Password must contain at least one uppercase letter";
    }
    if (!value.contains(RegExp(r"[0-9]"))) {
      // Fixed typo: 0-0 → 0-9
      return "Password must contain at least one number";
    }
    return null;
  }

  // ✅ Confirm Password Validation
  static String? validateConfirmPassword(
    String originalPassword,
    String? value,
  ) {
    final passwordError = validatePassword(value);
    if (passwordError != null) {
      return passwordError;
    }
    if (value != originalPassword) {
      return "Passwords do not match";
    }
    return null;
  }

  // ✅ Phone Number Validation
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "Phone number is Required";
    }
    if (value.length < 10) {
      return "Phone number must be at least 10 digits";
    }
    if (!RegExp(r"^[0-9]+$").hasMatch(value)) {
      return "Phone number must contain only digits";
    }

    return null;
  }
}
