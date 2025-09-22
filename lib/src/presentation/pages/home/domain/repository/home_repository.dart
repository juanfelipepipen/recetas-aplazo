import 'package:recetas_aplazo/src/data/entities/recipe.dart';

abstract class HomeRepository {
  /// Get recipes by initial char
  Future<RecipeList> getRecipes({required String char});
}
