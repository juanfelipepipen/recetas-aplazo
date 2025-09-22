import 'package:recetas_aplazo/src/data/entities/recipe.dart';

abstract class SearchRecipeRepository {
  /// Get recipes searching by input
  Future<RecipeList> searchFromUserInput({required String input});

  /// Add to like list a recipe
  bool like(int recipeId);
}
