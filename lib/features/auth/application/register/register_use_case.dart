import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/core/exceptions/auth_exceptions.dart';
import 'package:pudge/entities/user/user.dart';
import 'package:pudge/features/auth/data/auth_repository_impl.dart';
import 'package:pudge/features/auth/domain/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_use_case.g.dart';

@riverpod
RegisterUseCase registerUseCase(Ref ref) {
  return RegisterUseCase(ref.watch(authRepositoryProvider));
}

class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future execute(String email, String password) async {
    await _authRepository.registerWithEmail(email, password);
    final User? currentUser = _authRepository.currentUser;

    if (currentUser == null) throw UnknownAuthException.nullUser();
  }
}
