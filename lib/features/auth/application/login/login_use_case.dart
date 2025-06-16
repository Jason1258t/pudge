import 'package:pudge/core/exceptions/auth_exceptions.dart';
import 'package:pudge/features/auth/data/auth_repository_impl.dart';
import 'package:pudge/features/auth/domain/auth_repository.dart';
import 'package:pudge/features/user/data/user_repository_impl.dart';
import 'package:pudge/features/user/domain/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pudge/entities/user/user/user.dart';

part 'login_use_case.g.dart';

@riverpod
LoginUseCase loginUseCase(ref) {
  return LoginUseCase(
    ref.watch(authRepositoryProvider),
    ref.watch(userRepositoryProvider),
  );
}

class LoginUseCase {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  LoginUseCase(this._authRepository, this._userRepository);

  Future<User> execute(String email, String password) async {
    await _authRepository.loginWithEmail(email, password);
    final User? currentUser = _authRepository.currentUser;
    if (currentUser == null) {
      throw UnknownAuthException(message: "User is null after login");
    }
    return await _userRepository.getUser(currentUser.id);
  }
}
