import 'package:recetas_aplazo/src/feature/pages/search/domain/repository/search_recipe_repository.dart';
import 'package:recetas_aplazo/src/feature/pages/search/data/services/search_recipe_api_service.dart';
import 'package:recetas_aplazo/src/shared/storage/recipe_like_service.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';

class SearchRecipeRepositoryImpl implements SearchRecipeRepository {
  SearchRecipeRepositoryImpl({
    required SearchRecipeApiService service,
    required RecipeLikeService likeService,
  }) : _service = service,
       _likeService = likeService;

  final RecipeLikeService _likeService;
  final SearchRecipeApiService _service;

  @override
  Future<RecipeList> searchFromUserInput({required String input}) async {
    final recipes = await _service.request(input: input);
    return _likeService.setLikesFromList(recipes);
  }

  @override
  bool like(int recipeId) {
    return _likeService.like(recipeId);
  }
}
