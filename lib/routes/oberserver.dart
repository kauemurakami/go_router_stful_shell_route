import 'package:flutter/material.dart';

class NavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    _logFullPath(route);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    _logFullPath(previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _logFullPath(newRoute);
  }

  void _logFullPath(Route? route) {
    if (route?.settings.name != null) {
      print('Navigated to: ${route!.settings.name}');
    } else {
      print('Navigated to unnamed route');
    }
  }
}
