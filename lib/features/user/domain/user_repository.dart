import 'package:pudge/entities/user/create_user_dto/create_user_dto.dart';
import 'package:pudge/entities/user/user/user.dart';

abstract interface class UserRepository {
  Future<User> getUser(String id);

  Future<User> editUser(User newData);

  Future<User> createUser(UserCreateDTO data, {String? id});
}
