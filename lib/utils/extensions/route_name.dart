extension RouteName on String {
  String get routeName => contains('/') ? replaceFirst('/', '') : this;
}
