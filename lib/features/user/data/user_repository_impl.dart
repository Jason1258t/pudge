import 'package:pudge/core/exceptions/user_exceptions.dart';
import 'package:pudge/entities/user/create_user_dto/create_user_dto.dart';
import 'package:pudge/entities/user/user/user.dart';
import 'package:pudge/features/user/domain/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pudge/features/user/data/datasources/user_firestore_datasource.dart';

part 'user_repository_impl.g.dart';

@riverpod
UserRepository userRepository(ref) {
  return UserRepositoryImpl(ref.watch(userFirestoreDatasourceProvider));
}

class UserRepositoryImpl implements UserRepository {
  final UserFirestoreDatasource _firestoreDatasource;

  UserRepositoryImpl(this._firestoreDatasource);

  @override
  Future<User> getUser(String id) async {
    final user = await _firestoreDatasource.getUserData(id);
    if (user != null) return user;
    throw UserNotFoundException(id);
  }

  @override
  Future<User> editUser(User newData) async {
    await _firestoreDatasource.saveUserData(newData);
    return newData;
  }

  @override
  Future<User> createUser(UserCreateDTO data, {String? id}) async {
    final id = await _firestoreDatasource.createUser(data);
    final user = await _firestoreDatasource.getUserData(id);
    return user!;
  }
}
