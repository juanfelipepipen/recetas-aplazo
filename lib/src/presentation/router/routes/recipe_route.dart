import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/presentation/pages/recipe/presentation/recipe_page.dart';
import 'package:go_router/go_router.dart';
import 'package:pipen/extensions.dart';
import 'package:pipen/routes.dart';

class RecipeRoute extends TypeSafeRoute {
  RecipeRoute({required int recipeId, required OnRecipe onChange})
    : super(
        name: routeName,
        path: routePath,
        extra: onChange,
        pathParameters: {'id': recipeId.toString()},
      );

  static const String routePath = '/recipe/:id';
  static const String routeName = 'recipe';

  static GoRoute route = GoRoute(
    path: routePath,
    name: routeName,
    builder: (context, state) => RecipePage(
      onChange: state.extra as OnRecipe,
      recipeId: (state.pathParameters['id'] as String).toInt(),
    ),
  );
}
