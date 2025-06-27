class AppAuthException implements Exception {}

class UnknownAuthException implements AppAuthException {
  UnknownAuthException({this.message});

  UnknownAuthException.nullUser() : message = "User is null after login";

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

class NotAuthorizedException implements AppAuthException {
  @override
  String toString() {
    return "Application not authorized";
  }
}