import 'package:recetas_aplazo/src/presentation/pages/search/domain/repository/search_recipe_repository.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'dart:async';

class RecipeSearchCubit extends CubitFetchResolverPending<RecipeList> {
  RecipeSearchCubit({required SearchRecipeRepository repository}) : _repository = repository;

  final SearchRecipeRepository _repository;
  Timer? _debounceSearch;

  /// Search recipe
  void search(String value) {
    _debounceSearch?.cancel();

    if (value.isEmpty) {
      return emit(FetchPending<RecipeList>());
    }

    _debounceSearch = Timer(
      Duration(seconds: 1),
      () => fetch(_repository.searchFromUserInput(input: value)),
    );
  }

  /// Like recipe using recipe repository
  Future<bool?> like(int recipeId, bool current) async {
    if (state is! FetchSuccess) return null;

    final recipes = (state as FetchSuccess<RecipeList>).result;
    final index = recipes.indexWhere((recipe) => recipe.id == recipeId);

    if (index == -1) return null;

    final like = _repository.like(recipeId);
    RecipeList newRecipes = [...recipes];
    newRecipes[index] = newRecipes[index].copyWith(like: like);

    emit(FetchSuccess<RecipeList>(newRecipes));
    return like;
  }

  /// Update recipe
  void update(Recipe recipe) {
    if (state is! FetchSuccess) return;

    final recipes = (state as FetchSuccess<RecipeList>).result;
    final index = recipes.indexWhere((r) => r.id == recipe.id);
    if (index == -1) return;

    RecipeList newRecipes = [...recipes];
    newRecipes[index] = recipe;

    emit(FetchSuccess<RecipeList>(newRecipes));
  }

  @override
  Future<void> close() {
    _debounceSearch?.cancel();
    return super.close();
  }
}
