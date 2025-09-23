import 'package:recetas_aplazo/src/feature/pages/recipe/domain/repository/recipe_repository.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:pipen_bloc/pipen_bloc.dart';

class RecipeDetailBloc extends CubitFetch<Recipe> {
  RecipeDetailBloc({required this.recipeId, required RecipeRepository repository})
    : _repository = repository;

  final RecipeRepository _repository;
  final int recipeId;

  @override
  get resolver async => _repository.getRecipe(id: recipeId);

  /// Like recipe using recipe repository
  Future<bool?> like(bool current) async {
    if (state is! FetchSuccess) return null;

    final recipe = (state as FetchSuccess<Recipe>).result;
    final like = _repository.like(recipeId);

    emit(FetchSuccess<Recipe>(recipe.copyWith(like: like)));

    return like;
  }
}
