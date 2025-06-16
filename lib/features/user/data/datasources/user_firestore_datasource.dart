import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pudge/entities/user/create_user_dto/create_user_dto.dart';
import 'package:pudge/entities/user/user/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_firestore_datasource.g.dart';

@riverpod
UserFirestoreDatasource userFirestoreDatasource(_) {
  return UserFirestoreDatasource();
}

class UserFirestoreDatasource {
  static final _userCollection = FirebaseFirestore.instance.collection("users");

  Future<User?> getUserData(String id) async {
    final doc = await _userCollection.doc(id).get();
    if (doc.exists) return User.fromJson(doc.data()!);
    return null;
  }

  Future<String> createUser(UserCreateDTO user, {String? id}) async {
    if (id != null) {
      await _userCollection.doc(id).set(user.toJson());
      return id;
    } else {
      final doc = await _userCollection.add(user.toJson());
      await doc.update({"id": doc.id});
      return doc.id;
    }
  }

  Future<void> saveUserData(User user) async {
    await _userCollection.doc(user.id).set(user.toJson());
  }
}
