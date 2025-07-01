import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/app/router/route_names/auth_route_names.dart';
import 'package:pudge/app/router/route_names/home_route_names.dart';
import 'package:pudge/features/auth/application/auth_state_notifier.dart';
import 'package:pudge/features/auth/domain/app_authorization_state.dart';
import 'package:pudge/pages/auth/login_page.dart';
import 'package:pudge/pages/auth/register_page.dart';
import 'package:pudge/pages/home/home_shell.dart';
import 'package:pudge/pages/profile/profile_page.dart';
import 'package:pudge/pages/splash/splash_screen.dart';
import 'package:pudge/pages/studio/studio_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    refreshListenable: _RouterRefreshListenable(ref),
    redirect: (context, state) {
      final auth = ref.read(authStateNotifierProvider);
      final loggedIn = auth.value is AppAuthState;
      final inAuthFlow = AuthRouteNames.isAuthPage(state.matchedLocation);

      if (!state.matchedLocation.contains('home')) return HomeRouteNames.profile; // TODO for tests
      return null;

      if (!loggedIn && !inAuthFlow) return AuthRouteNames.login;
      if (loggedIn && inAuthFlow) return HomeRouteNames.profile;

      return null;
    },
    routes: [
      GoRoute(path: '/', builder: (_, __) => const SplashScreen()),
      GoRoute(
        path: AuthRouteNames.login,
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        path: AuthRouteNames.register,
        builder: (_, __) => const RegisterPage(),
      ),

      ShellRoute(
        builder: (_, __, child) => HomeShell(child: child),
        routes: [
          GoRoute(
            path: HomeRouteNames.main,
            pageBuilder: (_, __) => const NoTransitionPage(
              child: Scaffold(
                body: Center(child: Text('Home Tab 1')),
              ),
            ),
          ),
          GoRoute(
            path: HomeRouteNames.studio,
            pageBuilder: (_, __) => const NoTransitionPage(
              child: StudioPage(),
            ),
          ),
          GoRoute(
            path: HomeRouteNames.profile,
            pageBuilder: (_, __) => const NoTransitionPage(
              child: ProfilePage(),
            ),
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
