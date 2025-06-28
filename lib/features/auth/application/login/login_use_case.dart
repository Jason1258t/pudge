import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/core/exceptions/auth_exceptions.dart';
import 'package:pudge/features/auth/data/auth_repository_impl.dart';
import 'package:pudge/features/auth/domain/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pudge/entities/user/user.dart';

part 'login_use_case.g.dart';

@riverpod
LoginUseCase loginUseCase(Ref ref) {
  return LoginUseCase(
    ref.watch(authRepositoryProvider),
  );
}

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future execute(String email, String password) async {
    await _authRepository.loginWithEmail(email, password);
    final User? currentUser = _authRepository.currentUser;

    if (currentUser == null) throw UnknownAuthException.nullUser();
  }
}
