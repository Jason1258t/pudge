import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pudge/core/exceptions/auth_exceptions.dart';
import 'package:pudge/core/firebase/firebase_exception_mapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_service.g.dart';

@Riverpod()
FirebaseAuthService firebaseAuthService(_) {
  return FirebaseAuthService();
}

class FirebaseAuthService {
  static final _auth = FirebaseAuth.instance;

  late final Stream<User?> _currentUserSubject;

  FirebaseAuthService() {
    _currentUserSubject = _auth.authStateChanges();
  }

  Stream<User?> get userChanges => _currentUserSubject;

  User? get currentUser => _auth.currentUser;

  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return _handleAuthErrors(() async {
      final res = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _verifyResponse(res);
      return res;
    });
  }

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    return _handleAuthErrors(() async {
      final res = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _verifyResponse(res);
      return res;
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    return _handleAuthErrors(() async {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final res = await _auth.signInWithCredential(credential);
      _verifyResponse(res);
      return res;
    });
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  _verifyResponse(UserCredential res) {
    if (res.user == null) throw UnknownAuthException();
  }

  Future<T> _handleAuthErrors<T>(Future<T> Function() action) async {
    try {
      final result = await action();
      return result;
    } on FirebaseAuthException catch (e) {
      throw FirebaseExceptionMapper.mapAuthException(e);
    } catch (e) {
      throw UnknownAuthException(message: e.toString());
    }
  }
}
