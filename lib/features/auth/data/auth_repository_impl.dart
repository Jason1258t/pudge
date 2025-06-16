import 'package:pudge/core/firebase/auth/firebase_auth_service.dart';
import 'package:pudge/entities/user/user/user.dart';
import 'package:pudge/features/auth/domain/app_authorization_state.dart';
import 'package:pudge/features/auth/domain/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pudge/core/firebase/firebase_user_map.dart';

part 'auth_repository_impl.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(ref) {
  return AuthRepositoryImpl(ref.watch(firebaseAuthServiceProvider));
}

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService _auth;
  late final BehaviorSubject<AppAuthorizationState> _appAuthStateChanges;

  AuthRepositoryImpl(FirebaseAuthService authService) : _auth = authService {
    _appAuthStateChanges = BehaviorSubject<AppAuthorizationState>.seeded(
      AppUnAuthState(),
    );
    _auth.userChanges.listen((user) {
      if (user != null) {
        _appAuthStateChanges.add(AppAuthState(user.toDomain()));
      } else {
        _appAuthStateChanges.add(AppUnAuthState());
      }
    });
  }

  @override
  get appAuthStateChanges => _appAuthStateChanges;

  @override
  User? get currentUser {
    if (_auth.currentUser != null) return _auth.currentUser!.toDomain();
    return null;
  }

  @override
  Future loginWithEmail(String email, String password) =>
      _auth.signInWithEmailAndPassword(email, password);

  @override
  Future registerWithEmail(String email, String password) =>
      _auth.registerWithEmailAndPassword(email, password);

  @override
  Future signInWithGoogle() => _auth.signInWithGoogle();
}
