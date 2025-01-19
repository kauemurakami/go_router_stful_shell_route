abstract class AppRoutes {
  static const home = '/home';
  static const profile = '/profile';
  static const settings = '/settings';
  static const product = ':id';
  static const productName = 'products';
}

extension RouteName on String {
  String get routeName => contains('/') ? replaceFirst('/', '') : this;
}
