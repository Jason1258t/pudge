import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/entities/post/post.dart';

class PostsState {
  final AsyncValue<List<Post>> createdPosts;
  final AsyncValue<List<Post>> savedPosts;

  const PostsState({
    this.createdPosts = const AsyncValue.loading(),
    this.savedPosts = const AsyncValue.loading(),
  });

  PostsState copyWith({
    AsyncValue<List<Post>>? createdPosts,
    AsyncValue<List<Post>>? savedPosts,
  }) {
    return PostsState(
      createdPosts: createdPosts ?? this.createdPosts,
      savedPosts: savedPosts ?? this.savedPosts,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostsState &&
          runtimeType == other.runtimeType &&
          createdPosts == other.createdPosts &&
          savedPosts == other.savedPosts;

  @override
  int get hashCode => createdPosts.hashCode ^ savedPosts.hashCode;
}
