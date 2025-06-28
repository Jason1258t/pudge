import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/app/api_registery.dart';
import 'package:pudge/entities/post/post.dart';
import 'package:pudge/entities/user/user.dart';
import 'package:pudge/features/profile/data/profile_api.dart';
import 'package:pudge/features/profile/domain/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_repository_impl.g.dart';

@riverpod
ProfileRepository profileRepository(Ref ref) {
  return ProfileRepositoryImpl(ref.watch(apiServiceProvider).getService());
}

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileApi _api;

  ProfileRepositoryImpl(this._api);

  Future<User>? _user;
  Future<List<Post>>? _savedPosts;
  Future<List<Post>>? _createdPosts;

  @override
  void clear() {
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getCreatedPosts() {
    _createdPosts ??= _api.getCreatedPosts().then(
      (res) => res.map((e) => Post.fromJson(e)).toList(),
    );
    return _createdPosts!;
  }

  @override
  Future<User?> getCurrentUser() {
    if (_user == null) {
      throw Exception("to use this field, need to init repo by load()");
    }
    return _user!;
  }

  @override
  Future<List<Post>> getSavedPosts() {
    _savedPosts ??= _api.getSavedPosts().then(
      (res) => res.map((e) => Post.fromJson(e)).toList(),
    );
    return _savedPosts!;
  }

  @override
  Future<void> load() async {
    _user = _api.getCurrentUser().then((res) => User.fromJson(res));
  }
}
