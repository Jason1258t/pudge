import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/app/router/route_names/auth_route_names.dart';
import 'package:pudge/app/router/route_names/home_route_names.dart';
import 'package:pudge/pages/auth/login_page.dart';
import 'package:pudge/pages/auth/register_page.dart';
import 'package:pudge/pages/explore/explore_page.dart';
import 'package:pudge/pages/home/home_shell.dart';
import 'package:pudge/pages/post/post_page.dart';
import 'package:pudge/pages/profile/profile_page.dart';
import 'package:pudge/pages/splash/splash_screen.dart';
import 'package:pudge/pages/studio/studio_page.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'listener.dart';
import 'redirect.dart';

part 'router.g.dart';

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  final redirectManager = AppRedirectManager(ref, skipAuthFlow: true);

  return GoRouter(
    initialLocation: '/',
    refreshListenable: RouterListener(ref),
    redirect: redirectManager.redirect,
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => const SplashScreen(),
        routes: [
          GoRoute(
            path: AuthRouteNames.login,
            builder: (_, __) => const LoginPage(),
          ),
          GoRoute(
            path: AuthRouteNames.register,
            builder: (_, __) => const RegisterPage(),
          ),
          ShellRoute(
            builder: (_, state, child) {
              final loc = state.matchedLocation;
              final idx = HomeRouteNames.getPageIndex(loc);
              return HomeShell(
                index: idx != -1 ? idx : 0, // TODO rework
                child: child,
              );
            },
            routes: [
              GoRoute(
                path: HomeRouteNames.explore,
                pageBuilder: (_, __) => NoTransitionPage(child: ExplorePage()),
              ),
              GoRoute(
                path: HomeRouteNames.studio,
                pageBuilder: (_, __) =>
                    const NoTransitionPage(child: StudioPage()),
              ),
              GoRoute(
                path: HomeRouteNames.profile,
                pageBuilder: (_, __) =>
                    const NoTransitionPage(child: ProfilePage()),
              ),
            ],
          ),
          GoRoute(
            path: '/post/:id',
            builder: (_, state) =>
                PostPage(postId: state.pathParameters['id']!),
          ),
        ],
      ),
    ],
  );
}
