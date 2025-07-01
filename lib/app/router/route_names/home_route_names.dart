class HomeRouteNames {
  static const profile = '/home/profile';
  static const studio = '/home/studio';
  static const main = '/home/main';

  static const _pages = [main, studio, profile];

  static int getPageIndex(String location) => _pages.indexOf(location);

  static String getPageRouteByIndex(int index) => _pages[index];
}
