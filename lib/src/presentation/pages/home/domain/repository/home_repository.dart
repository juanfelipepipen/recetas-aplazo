import 'package:recetas_aplazo/src/data/entities/recipe.dart';

abstract class HomeRepository {
  /// Get recipes by initial char
  Future<RecipeList> getRecipes({required String char});

  /// Add to like list a recipe
  Future<void> like(String recipeId);

  /// Unlike a recipe
  Future<void> unLike(String recipeId);
}
