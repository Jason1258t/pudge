import 'package:pudge/entities/user/user/user.dart';
import 'package:pudge/features/auth/domain/app_authorization_state.dart';
import 'package:rxdart/rxdart.dart';

abstract interface class AuthRepository {
  Future registerWithEmail(String email, String password);

  Future loginWithEmail(String email, String password);

  Future signInWithGoogle();

  User? get currentUser;

  BehaviorSubject<AppAuthorizationState> get appAuthStateChanges;
}
