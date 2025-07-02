class HomeRouteNames {
  static const profile = '/home/profile';
  static const studio = '/home/studio';
  static const explore = '/home/explore';

  static const _pages = [explore, studio, profile];

  static int getPageIndex(String location) => _pages.indexOf(location);

  static String getPageRouteByIndex(int index) => _pages[index];
}
