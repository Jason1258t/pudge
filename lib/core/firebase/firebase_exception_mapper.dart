import 'package:firebase_auth/firebase_auth.dart';
import 'package:pudge/core/exceptions/auth_exceptions.dart';

abstract class FirebaseExceptionMapper {
  static Exception mapAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'email-already-in-use':
        return EmailAlreadyInUseException();
      case 'invalid-email':
        return InvalidEmailException();
      case 'weak-password':
        return WeakPasswordException();
      case 'user-not-found':
        return UserNotFoundException();
      case 'wrong-password':
        return WrongPasswordException();
      default:
        return UnknownAuthException(message: e.message);
    }
  }
}
