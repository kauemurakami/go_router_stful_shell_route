import 'package:flutter/material.dart';

class RootInformationParser extends RouteInformationParser<Uri> {
  @override
  Future<Uri> parseRouteInformation(RouteInformation routeInformation) {
    print(' --- ${routeInformation.uri.path} --- ');
    return Future.value(
      routeInformation.uri,
    );
  }

  @override
  RouteInformation? restoreRouteInformation(Uri configuration) {
    return RouteInformation(
      uri: configuration,
    );
  }
}
