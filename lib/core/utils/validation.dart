class Validation {
  static String? isPhoneNumberValid(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber == '') {
      return "This field is required";
    }
    if (!phoneNumber.startsWith("09")) {
      return "Phone must start with 09";
    }
    if (phoneNumber.length < 10) {
      return "Phone must be 10 characters long";
    }
    return null;
  }

  static String? checkPasswordStrength(String? password,
      {bool isLogin = false}) {
    if (password == null || password == '') {
      return "This field is required";
    }
    if (password.length < 8) {
      return "Password should be at least 8 characters";
    }
    if (isLogin) return null;
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return "Password needs at least one uppercase letter";
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return "Password needs at least one lowercase letter";
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return "Password needs at least one digit";
    }
    return null;
  }

  static String? checkPasswordMatch(String? password, String? confirmPassword) {
    if (confirmPassword == null || confirmPassword == '') {
      return "This field is required";
    }

    if (password != confirmPassword) {
      return "Password and Confirm Password do not match";
    } else {
      return null; // Passwords match
    }
  }

  static String? validateEmail(String? email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (email == null || email == '') {
      return "This field is required";
    }

    if (!emailRegex.hasMatch(email)) {
      return "Invalid email address";
    }
    return null;
  }

  static String? length(String? text, {int min = 3, int max = 50}) {
    if (text == null || text.isEmpty) {
      return "This field is required";
    }

    if (text.length < min) {
      return 'Text is too short minimum length is $min';
    }

    if (text.length > max) {
      return 'Text is too long maximum length is $max';
    }

    return null;
  }

  static String? dateFormat(String? text) {
    if (text == null || text.isEmpty) {
      return "This field is required";
    }

    final RegExp dateRegExp = RegExp(
        r'^\d{4}-\d{2}-\d{2}$'); // Regular expression to match YYYY-MM-DD format

    if (!dateRegExp.hasMatch(text)) {
      return 'Please use YYYY-MM-DD';
    }

    final List<int> daysInMonth = [
      31,
      (isLeapYear(int.parse(text.substring(0, 4))) ? 29 : 28),
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31
    ];
    final List<String> parts = text.split('-');
    final int year = int.tryParse(parts[0]) ?? 0;
    final int month = int.tryParse(parts[1]) ?? 0;
    final int day = int.tryParse(parts[2]) ?? 0;

    if (year < (DateTime.now().year - 25) || year > (DateTime.now().year - 5)) {
      return 'Enter a valid age';
    }

    if (month < 1 || month > 12) {
      return 'Month should be between 1 and 12';
    }

    if (day < 1 || day > daysInMonth[month - 1]) {
      return 'Invalid day for the given month';
    }

    return null;
  }

  static bool isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }
}
