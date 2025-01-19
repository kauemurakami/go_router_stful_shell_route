import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stful_shell_go_router/routes/fade_transition.dart';
import 'package:stful_shell_go_router/routes/routes.dart';
import 'package:stful_shell_go_router/views/dashboard/dashboard.dart';
import 'package:stful_shell_go_router/views/home/home.dart';
import 'package:stful_shell_go_router/views/product.dart';
import 'package:stful_shell_go_router/views/profile.dart';
import 'package:stful_shell_go_router/views/settings.dart';

class MyGoRouterDelegate {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  GoRouter get router => _router;
  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoutes.home,
    routes: <RouteBase>[
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/',
        redirect: (context, state) {
          print(state.fullPath);
          return AppRoutes.home;
        },
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          print(state.fullPath);
          return DashboardView(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                name: AppRoutes.home.routeName,
                pageBuilder: (context, state) {
                  print(state.fullPath);

                  return CustomFadeTransition(
                    child: const HomeView(),
                  );
                },
                routes: [
                  GoRoute(
                      path: AppRoutes.product,
                      name: AppRoutes.productName,
                      pageBuilder: (context, state) {
                        print('${state.fullPath!.replaceFirst(':id', state.pathParameters['id']!)}');
                        return CustomFadeTransition(
                          child: ProductView(
                              //pode passar por parametro para a view/controller , no meu caso usei meu service com getIt para recuperar o state da rota juntamente com os parametros com getit, graças a ele podemos navegar sem context, baseado no nosso router.
                              // id: int.parse(state.pathParameters['id']!),
                              ),
                        );
                      }),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: AppRoutes.profile,
                  name: AppRoutes.profile.routeName,
                  pageBuilder: (context, state) {
                    print(state.fullPath);
                    return CustomFadeTransition(
                      child: const ProfileView(),
                    );
                  }),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                  path: AppRoutes.settings,
                  name: AppRoutes.settings.routeName,
                  pageBuilder: (context, state) {
                    print(state.fullPath);
                    return CustomFadeTransition(
                      child: const SettingsView(),
                    );
                  }),
            ],
          ),
        ],
      ),
    ],
  );
}
