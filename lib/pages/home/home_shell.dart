// screens/home_shell.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pudge/app/router/route_names/home_route_names.dart';
import 'package:pudge/core/theme/colors.dart';
import 'package:pudge/shared/ui/scaffold/custom_scaffold.dart';

class HomeShell extends StatelessWidget {
  final Widget child;
  const HomeShell({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final loc = GoRouter.of(context).state.matchedLocation;
    final idx = HomeRouteNames.getPageIndex(loc);

    return CustomScaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.navigation,

        currentIndex: idx,
        unselectedItemColor: AppColors.onBackground,
        selectedItemColor: AppColors.primary,
        onTap: (i) {
          context.go(HomeRouteNames.getPageRouteByIndex(i));
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Tab 1'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Studio'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
