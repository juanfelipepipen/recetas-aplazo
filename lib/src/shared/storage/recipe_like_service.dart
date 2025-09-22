import 'package:recetas_aplazo/objectbox.g.dart';
import 'package:recetas_aplazo/src/core/app_object_box.dart';
import 'package:recetas_aplazo/src/data/entities/recipe_like.dart';

class RecipeLikeService {
  /// Find recipe like model
  RecipeLike? getRecipeLike(int recipeId) {
    final box = store.box<RecipeLike>();
    final query = box.query(RecipeLike_.recipeId.equals(recipeId)).build();
    final results = query.findFirst();
    query.close();
    return results;
  }

  /// Get all recipe like items
  RecipeLikeList? getAll() {
    final box = store.box<RecipeLike>();
    return box.getAll();
  }

  /// Find recipe like model
  bool like(int recipeId) {
    final box = store.box<RecipeLike>();
    final query = box.query(RecipeLike_.recipeId.equals(recipeId)).build();
    final recipeLike = query.findFirst();

    if (recipeLike == null) {
      box.put(RecipeLike(recipeId: recipeId));
      query.close();
      return true;
    }
    box.remove(recipeLike.id);
    query.close();
    return false;
  }
}
