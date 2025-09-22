import 'package:recetas_aplazo/src/presentation/pages/home/domain/repository/home_repository.dart';
import 'package:recetas_aplazo/src/presentation/pages/home/data/services/home_api_service.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/shared/storage/recipe_like_service.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required HomeApiService service, required RecipeLikeService likeService})
    : _service = service,
      _likeService = likeService;

  final HomeApiService _service;
  final RecipeLikeService _likeService;

  @override
  Future<RecipeList> getRecipes({required String char}) async {
    RecipeList recipes = await _service.request(char: char);

    final likes = _likeService.getAll() ?? [];
    final likedIds = likes.map((recipeLike) => recipeLike.recipeId).toSet();

    for (var i = 0; i < recipes.length; i++) {
      final recipe = recipes[i];
      if (likedIds.contains(recipe.id)) {
        recipes[i] = recipe.copyWith(like: true);
      }
    }

    return recipes;
  }

  @override
  Future<void> like(String recipeId) async {
    // TODO: implement like
    // throw UnimplementedError();
  }

  @override
  Future<void> unLike(String recipeId) async {
    // TODO: implement unLike
    // throw UnimplementedError();
  }
}
