abstract class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email must not be empty';
    }
    final emailRegex = RegExp(r'^[\w.-]+@[\w.-]+\.\w{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Invalid email format';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password must not be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    if (value.contains(' ')) {
      return 'Password must not contain spaces';
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name must not be empty';
    }
    final nameRegex = RegExp(r"^[a-zA-Zа-яА-ЯёЁ\s]+$");
    if (!nameRegex.hasMatch(value)) {
      return 'Name can only contain letters and spaces';
    }
    if (value.length > 30) {
      return 'Name must not exceed 30 characters';
    }
    return null;
  }

  static String? validateBio(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Bio must not be empty';
    }
    final bioRegex = RegExp(r"^[a-zA-Zа-яА-ЯёЁ0-9\s.,!?\-()]+$");
    if (!bioRegex.hasMatch(value)) {
      return 'Bio contains invalid characters';
    }
    if (value.length > 150) {
      return 'Bio must not exceed 150 characters';
    }
    return null;
  }
}
