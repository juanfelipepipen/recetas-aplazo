import 'package:recetas_aplazo/src/shared/dio/dio_service.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';

class HomeApiService extends DioService {
  /// Request recipes list
  Future<RecipeList> request({required String char}) async {
    final response = await get("search.php?f=$char");
    return Recipe.fromList(response.json['meals']);
  }
}
