import 'package:get/get_utils/src/get_utils/get_utils.dart';

class Validator {
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) return 'Username is required';

    // Length Check
    if (value.length < 6) return 'Minimum 6 characters required';

    // Regex for specific patterns
    // Rule: Cannot start/end with a dot, no consecutive dots
    final usernameRegex = RegExp(r'^(?![.])(?!.*[.]{2})[a-z0-9._-]+(?<![.])$');
    if (!usernameRegex.hasMatch(value)) {
      return 'Invalid format (e.g., cannot start/end with dots)';
    }

    // Reserved Words Check
    const reserved = ['admin', 'root', 'support', 'help'];
    if (reserved.contains(value.toLowerCase())) {
      return 'This username is reserved';
    }

    return null; // Valid
  }
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    // Use GetX built-in validator
    if (!GetUtils.isEmail(value)) {
      return 'Enter a valid email address';
    }

    return null; // Valid
  }

  static String? validateEgyptianPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // Regex for Egyptian mobile numbers
    final phoneRegex = RegExp(r'^01[0125][0-9]{8}$');

    if (!phoneRegex.hasMatch(value)) {
      return 'Enter a valid Egyptian phone (e.g., 01012345678)';
    }

    return null; // Valid
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    // Length check
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    // Complexity check using Regex
    final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])');

    if (!passwordRegex.hasMatch(value)) {
      return 'Must include upper, lower, number, and special character';
    }

    return null; // Valid
  }

}
