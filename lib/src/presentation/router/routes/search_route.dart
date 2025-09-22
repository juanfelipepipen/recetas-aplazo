import 'package:recetas_aplazo/src/presentation/pages/search/presentation/search_page.dart';
import 'package:go_router/go_router.dart';
import 'package:pipen/routes.dart';

class SearchRoute extends TypeSafeRoute {
  SearchRoute() : super(name: routeName, path: routePath);

  static const String routePath = '/search';
  static const String routeName = 'search';

  static GoRoute route = GoRoute(
    path: routePath,
    name: routeName,
    builder: (context, state) => SearchPage(),
  );
}
