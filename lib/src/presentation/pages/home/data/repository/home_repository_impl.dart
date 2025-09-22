import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/presentation/pages/home/data/services/home_api_service.dart';
import 'package:recetas_aplazo/src/presentation/pages/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required HomeApiService service}) : _service = service;

  final HomeApiService _service;

  @override
  Future<RecipeList> getRecipes({required String char}) {
    return _service.request(char: char);
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
