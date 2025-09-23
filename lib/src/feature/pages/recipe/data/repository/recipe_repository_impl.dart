import 'package:recetas_aplazo/src/feature/pages/recipe/domain/repository/recipe_repository.dart';
import 'package:recetas_aplazo/src/feature/pages/recipe/data/services/recipe_api_service.dart';
import 'package:recetas_aplazo/src/shared/storage/recipe_like_service.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  RecipeRepositoryImpl({required RecipeApiService service, required RecipeLikeService likeService})
    : _service = service,
      _likeService = likeService;

  final RecipeLikeService _likeService;
  final RecipeApiService _service;

  @override
  Future<Recipe> getRecipe({required int id}) async {
    final recipe = await _service.request(recipeId: id);
    final recipeLike = _likeService.getRecipeLike(id);
    return recipe.copyWith(like: recipeLike != null);
  }

  @override
  bool like(int recipeId) {
    return _likeService.like(recipeId);
  }
}
