import 'package:recetas_aplazo/src/feature/pages/root/root_builder_page.dart';
import 'package:recetas_aplazo/src/shared/router/routes/recipe_route.dart';
import 'package:recetas_aplazo/src/shared/router/routes/search_route.dart';
import 'package:recetas_aplazo/src/shared/router/routes/home_route.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  debugLogDiagnostics: false,
  // errorBuilder: (context, state) => const AppError(),
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => RootBuilderPage(child: child),
      routes: [HomeRoute.route, RecipeRoute.route, SearchRoute.route],
    ),
  ],
);
