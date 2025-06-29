import 'package:pudge/features/profile/presentation/profile_notifier/posts_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:pudge/features/profile/data/profile_repository_impl.dart';

part 'posts_notifier.g.dart';

@riverpod
class CurrentPostsNotifier extends _$CurrentPostsNotifier {
  @override
  PostsState build() => const PostsState();

  Future<void> loadCreatedPosts({int? limit, String? cursor}) async {
    final repo = ref.read(profileRepositoryProvider);

    try {
      final posts = await repo.getCreatedPosts();
      state = state.copyWith(createdPosts: AsyncValue.data(posts));
    } catch (e, st) {
      state = state.copyWith(createdPosts: AsyncValue.error(e, st));
    }
  }

  Future<void> loadSavedPosts({int? limit, String? cursor}) async {
    final repo = ref.read(profileRepositoryProvider);

    try {
      final posts = await repo.getSavedPosts();
      state = state.copyWith(savedPosts: AsyncValue.data(posts));
    } catch (e, st) {
      state = state.copyWith(savedPosts: AsyncValue.error(e, st));
    }
  }

  void clearCache() {
    ref.read(profileRepositoryProvider).clearPosts();
    state = const PostsState();
  }
}
