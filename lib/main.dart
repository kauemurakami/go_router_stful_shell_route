import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stful_shell_go_router/routes/delegate.dart';
import 'package:stful_shell_go_router/routes/information_parser.dart';
import 'package:stful_shell_go_router/utils/setup_locator.dart';
import 'package:stful_shell_go_router/views/home/home.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'StfulShellRoute',
      theme: ThemeData(
        useMaterial3: true,
      ),
      routerConfig: getIt<MyGoRouterDelegate>().router,
    );
  }
}
