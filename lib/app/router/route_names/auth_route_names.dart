class AuthRouteNames {
  static const root = '/auth';
  static const login = '$root/login';
  static const register = '$root/register';

  static bool isAuthPage(String loc) => loc.startsWith(root);
}