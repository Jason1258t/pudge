import 'package:pudge/entities/user/user/user.dart';
import 'package:pudge/features/auth/domain/app_authorization_state.dart';
import 'package:rxdart/rxdart.dart';

abstract interface class AuthRepository {
  Future<User> registerWithEmail(String email, String password);

  Future<User> loginWithEmail(String email, String password);

  Future<User> signInWithGoogle();

  BehaviorSubject<AppAuthorizationState> get appAuthStateChanges;
}
