import 'package:recetas_aplazo/objectbox.g.dart';
import 'package:recetas_aplazo/src/core/app_object_box.dart';
import 'package:recetas_aplazo/src/data/entities/recipe_like.dart';

class RecipeLikeService {
  /// Find recipe like model
  RecipeLike? like(int recipeId) {
    final box = store.box<RecipeLike>();
    final query = box.query(RecipeLike_.recipeId.equals(recipeId)).build();
    final results = query.findFirst();
    query.close();
    return results;
  }
}
