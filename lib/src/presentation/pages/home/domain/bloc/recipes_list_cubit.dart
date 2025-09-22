import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recetas_aplazo/src/shared/storage/recipe_like_service.dart';

class RecipesListCubit extends Cubit<RecipeList> {
  RecipesListCubit() : super([]);

  /// Add recipes to list
  void add(RecipeList recipes) {
    emit([...state, ...recipes]);
  }

  /// Like recipe using recipe repository
  Future<bool?> like(int recipeId, bool current) async {
    final index = state.indexWhere((recipe) => recipe.id == recipeId);
    if (index == -1) return null;

    final service = RecipeLikeService();
    final like = service.like(recipeId);
    RecipeList newRecipes = [...state];
    newRecipes[index] = newRecipes[index].copyWith(like: like);
    emit(newRecipes);
    return like;
  }

  /// Update recipe
  void update(Recipe recipe) {
    final index = state.indexWhere((r) => r.id == recipe.id);
    if (index == -1) return;
    RecipeList newRecipes = [...state];
    newRecipes[index] = recipe;
    emit(newRecipes);
  }
}
