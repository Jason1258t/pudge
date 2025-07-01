import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/features/auth/application/auth_state_notifier.dart';
import 'package:pudge/features/auth/domain/app_authorization_state.dart';
import 'package:pudge/pages/auth/login_page.dart';
import 'package:pudge/pages/auth/register_page.dart';
import 'package:pudge/pages/profile/profile_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: '/login',
    refreshListenable: _RouterRefreshListenable(ref),
    redirect: (context, state) {
      final auth = ref.read(authStateNotifierProvider);
      final loggedIn = auth is AppAuthState;
      final inAuthFlow = state.matchedLocation.startsWith('/auth');

      if (!loggedIn && !inAuthFlow) return '/auth/login';
      if (loggedIn && inAuthFlow) return '/home/profile';

      return null;
    },
    routes: [
      GoRoute(path: '/auth/login', builder: (_, __) => const LoginPage()),
      GoRoute(path: '/auth/register', builder: (_, __) => const RegisterPage()),

      ShellRoute(
        builder: (_, __, child) => Container(child: child),
        routes: [
          GoRoute(
            path: '/home/tab1',
            builder: (_, __) =>
                Scaffold(body: const Center(child: Text('Home Tab 1'))),
          ),
          GoRoute(
            path: '/home/profile',
            builder: (_, __) => const ProfilePage(),
          ),
        ],
      ),
    ],
  );
}

class _RouterRefreshListenable extends ChangeNotifier {
  _RouterRefreshListenable(this._ref) {
    _ref.listen(authStateNotifierProvider, (previous, next) {
      if (previous.runtimeType != next.runtimeType) {
        notifyListeners();
      }
    });
  }

  final Ref _ref;

  @override
  void dispose() {
    // Не вызываем super.dispose() для keepAlive провайдера
  }
}
