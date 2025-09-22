import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/presentation/pages/search/data/services/search_recipe_api_service.dart';
import 'package:recetas_aplazo/src/presentation/pages/search/domain/repository/search_recipe_repository.dart';

class SearchRecipeRepositoryImpl implements SearchRecipeRepository {
  SearchRecipeRepositoryImpl({required SearchRecipeApiService service}) : _service = service;

  final SearchRecipeApiService _service;

  @override
  Future<RecipeList> searchFromUserInput({required String input}) {
    return _service.request(input: input);
  }
}
