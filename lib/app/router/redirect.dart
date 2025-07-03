import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pudge/app/router/route_names/auth_route_names.dart';
import 'package:pudge/features/auth/application/auth_state_notifier.dart';
import 'package:pudge/features/auth/domain/app_authorization_state.dart';

import 'route_names/home_route_names.dart';

class AppRedirectManager {
  final Ref _ref;
  final bool skipAuthFlow;

  AppRedirectManager(this._ref, {this.skipAuthFlow = false});

  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    final auth = _ref.read(authStateNotifierProvider);
    final loc = state.matchedLocation;
    final loggedIn = auth.value is AppAuthState;
    final inAuthFlow = AuthRouteNames.isAuthPage(loc);

    if (skipAuthFlow) {
      if (!loc.contains('home') && !loc.contains('post')) return HomeRouteNames.explore;
      return null;
    }

    if (!loggedIn && !inAuthFlow) return AuthRouteNames.login;
    if (loggedIn && inAuthFlow) return HomeRouteNames.profile;

    return null;
  }
}
