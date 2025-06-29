import 'package:pudge/entities/user/user.dart';
import 'package:pudge/features/auth/data/auth_repository_impl.dart';
import 'package:pudge/features/auth/domain/app_authorization_state.dart';
import 'package:pudge/features/profile/data/profile_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_notifier.g.dart';

@riverpod
class CurrentProfileNotifier extends _$CurrentProfileNotifier {
  @override
  FutureOr<User?> build() async {
    ref.read(authRepositoryProvider).appAuthStateChanges.listen((e) {
      if (e is AppAuthState) {
        ref.read(profileRepositoryProvider).load();
      }
    });
    return await ref.read(profileRepositoryProvider).getCurrentUser();
  }

  Future<void> logout() async {
    ref.read(profileRepositoryProvider).clear();
    state = const AsyncValue.data(null);
  }
}
