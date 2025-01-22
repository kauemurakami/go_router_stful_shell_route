import './imports_delegate.dart';

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
                            // id: int.parse(state.pathParameters['id']!),
                            //pode passar por parametro para a view/controller , no meu caso usei minha instancia do router com getIt para recuperar o state da rota juntamente com os parametros passados, graças a ele podemos navegar sem context, baseado no nosso router.
                            ),
                      );
                    },
                  ),
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
