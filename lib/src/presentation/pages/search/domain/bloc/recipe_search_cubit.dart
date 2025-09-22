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

  @override
  Future<void> close() {
    _debounceSearch?.cancel();
    return super.close();
  }
}
