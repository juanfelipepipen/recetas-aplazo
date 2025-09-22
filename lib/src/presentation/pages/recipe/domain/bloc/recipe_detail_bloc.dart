import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:recetas_aplazo/src/presentation/pages/recipe/domain/repository/recipe_repository.dart';

class RecipeDetailBloc extends CubitFetch<Recipe> {
  RecipeDetailBloc({required this.recipeId, required RecipeRepository repository})
    : _repository = repository;

  final RecipeRepository _repository;
  final int recipeId;

  @override
  get resolver async => _repository.getRecipe(id: recipeId);

  void like(bool value) {}
}
