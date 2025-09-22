import 'package:recetas_aplazo/src/data/entities/recipe.dart';

abstract class RecipeRepository {
  /// Get recipes by initial char
  Future<Recipe> getRecipe({required int id});

  /// Add to like list a recipe
  Future<void> like(String recipeId);

  /// Unlike a recipe
  Future<void> unLike(String recipeId);
}
