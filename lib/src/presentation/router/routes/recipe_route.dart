import 'package:go_router/go_router.dart';
import 'package:pipen/extensions.dart';
import 'package:pipen/routes.dart';
import 'package:recetas_aplazo/src/presentation/pages/recipe/presentation/recipe_page.dart';

class RecipeRoute extends TypeSafeRoute {
  RecipeRoute({required int recipeId})
    : super(name: routeName, path: routePath, pathParameters: {'id': recipeId.toString()});

  static const String routePath = '/recipe/:id';
  static const String routeName = 'recipe';

  static GoRoute route = GoRoute(
    path: routePath,
    name: routeName,
    builder: (context, state) =>
        RecipePage(recipeId: (state.pathParameters['id'] as String).toInt()),
  );
}
