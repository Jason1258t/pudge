class AppAuthException implements Exception {}

class UnknownAuthException implements AppAuthException {
  UnknownAuthException({this.message});

  final String? message;

  @override
  String toString() {
    return "Unknown exception during authentication, message: $message";
  }
}

class EmailAlreadyInUseException implements AppAuthException {
  @override
  String toString() {
    return "This email is already in use";
  }
}

class InvalidEmailException implements AppAuthException {
  @override
  String toString() {
    return "Invalid email format";
  }
}

class WeakPasswordException implements AppAuthException {
  @override
  String toString() {
    return "This password too weak";
  }
}

class UserNotFoundException implements AppAuthException {
  @override
  String toString() {
    return "User not found";
  }
}

class WrongPasswordException implements AppAuthException {
  @override
  String toString() {
    return "Password is wrong";
  }
}
