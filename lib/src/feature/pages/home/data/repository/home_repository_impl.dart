import 'package:recetas_aplazo/src/feature/pages/home/domain/repository/home_repository.dart';
import 'package:recetas_aplazo/src/feature/pages/home/data/services/home_api_service.dart';
import 'package:recetas_aplazo/src/shared/storage/recipe_like_service.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required HomeApiService service, required RecipeLikeService likeService})
    : _service = service,
      _likeService = likeService;

  final HomeApiService _service;
  final RecipeLikeService _likeService;

  @override
  Future<RecipeList> getRecipes({required String char}) async {
    RecipeList recipes = await _service.request(char: char);
    return _likeService.setLikesFromList(recipes);
  }
}
