import 'package:pudge/entities/post/post.dart';
import 'package:pudge/entities/user/user.dart';

abstract interface class ProfileRepository {
  Future<User?> getCurrentUser();
  Future<List<Post>> getSavedPosts();
  Future<List<Post>> getCreatedPosts();
  Future<void> load();
  void clear();
}
