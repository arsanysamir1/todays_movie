class CreditCardValidator {

  static String? validateCardNumber(String? value) {
    if (value == null || value.isEmpty) return 'Enter card number';

    String input = value.replaceAll(RegExp(r'\s+\b|\b\s'), ""); // Remove spaces
    if (input.length < 13 || input.length > 19) return 'Invalid length';

    int sum = 0;
    bool alternate = false;
    for (int i = input.length - 1; i >= 0; i--) {
      int n = int.parse(input[i]);
      if (alternate) {
        n *= 2;
        if (n > 9) n -= 9;
      }
      sum += n;
      alternate = !alternate;
    }
    return (sum % 10 == 0) ? null : 'Invalid card number';
  }

  static String? validateExpiry(String? value) {
    if (value == null || value.isEmpty) return 'MM/YY';
    if (!RegExp(r'(0[1-9]|1[0-2])\/?([0-9]{2})').hasMatch(value)) return 'Invalid date';
    return null;
  }

  static String? validateCVV(String? value) {
    if (value == null || value.isEmpty || value.length < 3) return 'Invalid CVV';
    return null;
  }
}
