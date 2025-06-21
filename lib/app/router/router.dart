import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/features/auth/application/auth_state_notifier.dart';
import 'package:pudge/features/auth/domain/app_authorization_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final authState = ref.watch(authStateNotifierProvider);

  return GoRouter(
    initialLocation: '/',
    routes: [
      // ... ваши маршруты
    ],
    redirect: (context, state) {
      final bool isLoggedIn = authState is AppAuthState;
      final bool isAuthPath =
          state.uri.path == '/signIn' || state.uri.path == '/register';

      if (authState is AppAuthorizingState) {
        return state.uri.path == '/' ? null : '/';
      }
      if (!isLoggedIn) {
        return isAuthPath ? null : '/signIn';
      }
      if (isLoggedIn) {
        return isAuthPath ? '/home' : null;
      }
      return null;
    },
  );
}
