import 'dart:async';

import 'package:pudge/features/auth/data/auth_repository_impl.dart';
import 'package:pudge/features/auth/domain/app_authorization_state.dart';
import 'package:pudge/features/auth/domain/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthStateNotifier extends _$AuthStateNotifier {
  @override
  Stream<AppAuthorizationState> build() {
    final AuthRepository authRepository = ref.watch(authRepositoryProvider);
    return authRepository.appAuthStateChanges;
  }
}
