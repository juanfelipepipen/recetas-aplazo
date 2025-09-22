import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/presentation/pages/recipe/data/services/recipe_api_service.dart';
import 'package:recetas_aplazo/src/presentation/pages/recipe/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  RecipeRepositoryImpl({required RecipeApiService service}) : _service = service;

  final RecipeApiService _service;

  @override
  Future<Recipe> getRecipe({required int id}) {
    return _service.request(recipeId: id);
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
