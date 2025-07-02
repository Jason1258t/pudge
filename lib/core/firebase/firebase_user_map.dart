import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:pudge/entities/image/image.dart';
import 'package:pudge/entities/user/user.dart';

extension FirebaseUserMapper on firebase_auth.User {
  User toDomain() {
    return User(
      id: uid,
      username: displayName ?? email ?? "Unknown",
      avatar: photoURL != null
          ? ImageData(id: "1", originalUrl: photoURL!, width: 1, height: 1)
          : null,
    );
  }
}
