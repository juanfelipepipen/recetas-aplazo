import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';

class RecipesListCubit extends Cubit<List<Recipe>> {
  RecipesListCubit() : super([]);

  /// Add recipes to list
  void add(RecipeList recipes) {
    emit([...state, ...recipes]);
  }
}
