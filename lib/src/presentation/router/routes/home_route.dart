import 'package:go_router/go_router.dart';
import 'package:pipen/routes.dart';
import 'package:recetas_aplazo/src/presentation/pages/home/presentation/home_page.dart';

class HomeRoute extends TypeSafeRoute {
  HomeRoute() : super(name: routeName, path: routePath);

  static const String routePath = '/';
  static const String routeName = 'home';

  static GoRoute route = GoRoute(
    path: routePath,
    name: routeName,
    builder: (context, state) => HomePage(),
  );
}
