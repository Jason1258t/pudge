import 'package:pudge/core/exceptions/auth_exceptions.dart';
import 'package:pudge/entities/user/create_user_dto/create_user_dto.dart';
import 'package:pudge/entities/user/user/user.dart';
import 'package:pudge/features/auth/data/auth_repository_impl.dart';
import 'package:pudge/features/auth/domain/auth_repository.dart';
import 'package:pudge/features/user/data/user_repository_impl.dart';
import 'package:pudge/features/user/domain/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_use_case.g.dart';

@riverpod
RegisterUseCase registerUseCase(ref) {
  return RegisterUseCase(
    ref.watch(authRepositoryProvider),
    ref.watch(userRepositoryProvider),
  );
}

class RegisterUseCase {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;

  RegisterUseCase(this._authRepository, this._userRepository);

  Future<User> execute(String email, String password) async {
    await _authRepository.registerWithEmail(email, password);
    final User? currentUser = _authRepository.currentUser;


    if (currentUser == null) throw UnknownAuthException.nullUser();

    await _userRepository.createUser(
      UserCreateDTO(
        username: currentUser.username,
        avatarUrl: currentUser.avatarUrl,
      ),
      id: currentUser.id,
    );

    await _userRepository.setUserId(currentUser.id);
    return _userRepository.currentUser!;
  }
}
