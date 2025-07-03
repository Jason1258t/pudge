import 'dart:developer';

class HomeRouteNames {
  static const profile = '/home/profile';
  static const studio = '/home/studio';
  static const explore = '/home/explore';

  static const _pages = [explore, studio, profile];

  static int getPageIndex(String location) {
    if (_pages.contains(location)) return _pages.indexOf(location);
    return -1;
  }

  static String getPageRouteByIndex(int index) => _pages[index];
}
