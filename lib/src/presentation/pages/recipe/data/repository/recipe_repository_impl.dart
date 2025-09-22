import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/presentation/pages/recipe/data/services/recipe_api_service.dart';
import 'package:recetas_aplazo/src/presentation/pages/recipe/domain/repository/recipe_repository.dart';
import 'package:recetas_aplazo/src/shared/storage/recipe_like_service.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  RecipeRepositoryImpl({required RecipeApiService service, required RecipeLikeService likeService})
    : _service = service,
      _likeService = likeService;

  final RecipeLikeService _likeService;
  final RecipeApiService _service;

  @override
  Future<Recipe> getRecipe({required int id}) {
    return _service.request(recipeId: id);
  }

  @override
  Future<void> like(int recipeId) async {
    _likeService.like(recipeId);
  }
}
