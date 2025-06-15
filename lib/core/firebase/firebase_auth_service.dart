import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:pudge/core/exceptions/auth_exceptions.dart';
import 'package:pudge/entities/user/user/user.dart';

class FirebaseAuthService {
  static final _auth = firebase_auth.FirebaseAuth.instance;

  FirebaseAuthService() {
    _auth.authStateChanges().listen((firebase_auth.User? user) {
      log('current user: $user');
    });
  }

  Future<User?> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final res = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (res.user != null) {
        final User user = User(
          id: res.user!.uid,
          username: res.user!.displayName ?? res.user!.email!,
          avatarUrl: res.user!.photoURL,
          bio: null,
        );

        return user;
      }
      throw UnknownAuthException();
    } on firebase_auth.FirebaseAuthException catch (e) {
      log(e.code);
      log(e.message ?? 'Unknown Firebase Auth error');
      throw _mapFirebaseAuthException(e);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Future<User?> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final res = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (res.user != null) {
        final User user = User(
          id: res.user!.uid,
          username: res.user!.displayName,
          avatarUrl: res.user!.photoURL,
          bio: null,
        );
        return user;
      }
      throw UnknownAuthException();
    } on firebase_auth.FirebaseAuthException catch (e) {
      log(e.code);
      log(e.message ?? 'Unknown Firebase Auth error');
      throw _mapFirebaseAuthException(e);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  Exception _mapFirebaseAuthException(firebase_auth.FirebaseAuthException e) {
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

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
