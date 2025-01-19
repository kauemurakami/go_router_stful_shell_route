import 'package:get_it/get_it.dart';
import 'package:stful_shell_go_router/routes/delegate.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<MyGoRouterDelegate>(() => MyGoRouterDelegate());
}
