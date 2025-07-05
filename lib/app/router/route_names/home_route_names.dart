class HomeRouteNames {
  static const profile = '/home/profile';
  static const studio = '/home/studio';
  static const explore = '/home/explore';

  static const _pages = [explore, studio, profile];

  static int getPageIndex(String location) {
    try {
      return _pages.indexWhere((e) => e.contains(location));
    } catch (e) {
      return -1;
    }
  }

  static String getPageRouteByIndex(int index) => _pages[index];
}
