import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/app/api_registery.dart';
import 'package:pudge/core/firebase/auth/firebase_auth_service.dart';
import 'package:pudge/entities/user/user.dart';
import 'package:pudge/features/auth/data/auth_api.dart';
import 'package:pudge/features/auth/domain/app_authorization_state.dart';
import 'package:pudge/features/auth/domain/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pudge/core/firebase/firebase_user_map.dart';

part 'auth_repository_impl.g.dart';

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepositoryImpl(
    authService: ref.watch(firebaseAuthServiceProvider),
    authApi: ref.watch(apiServiceProvider).getService<AuthApi>(),
  );
}

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService _auth;
  final AuthApi _authApi;
  late final BehaviorSubject<AppAuthorizationState> _appAuthStateChanges;

  AuthRepositoryImpl({
    required FirebaseAuthService authService,
    required AuthApi authApi,
  }) : _auth = authService,
       _authApi = authApi {
    _appAuthStateChanges = BehaviorSubject.seeded(AppUnAuthState());
    _auth.userChanges.listen(_authListener);
  }

  _authListener(user) async {
    if (user != null) {
      await _authorizeApi();
      _appAuthStateChanges.add(AppAuthState());
    } else {
      _appAuthStateChanges.add(AppUnAuthState());
    }
  }

  Future<void> _authorizeApi() async {
    final token = await _auth.currentUser!.getIdToken();
    log(token.toString());
    await _authApi.auth(token!);
  }

  @override
  get appAuthStateChanges => _appAuthStateChanges;

  @override
  Future loginWithEmail(String email, String password) async {
    appAuthStateChanges.add(AppAuthLoadingState());
    await _auth.signInWithEmailAndPassword(email, password);
  }

  @override
  Future registerWithEmail(String email, String password) async {
    appAuthStateChanges.add(AppAuthLoadingState());
    await _auth.registerWithEmailAndPassword(email, password);
  }

  @override
  Future signInWithGoogle() async {
    appAuthStateChanges.add(AppAuthLoadingState());
    await _auth.signInWithGoogle();
  }
}
