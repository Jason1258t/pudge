import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pudge/app/router/route_names/home_route_names.dart';
import 'package:pudge/core/theme/colors.dart';
import 'package:pudge/shared/ui/scaffold/custom_scaffold.dart';

class HomeShell extends StatelessWidget {
  final Widget child;
  final int index;

  const HomeShell({required this.child, super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.navigation,
        currentIndex: index,
        unselectedItemColor: AppColors.onBackground,
        selectedItemColor: AppColors.primary,
        onTap: (i) {
          context.go(HomeRouteNames.getPageRouteByIndex(i));
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            activeIcon: Icon(Icons.camera_alt),
            label: 'Studio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
