import 'package:recetas_aplazo/src/shared/dio/dio_service.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';

class SearchRecipeApiService extends DioService {
  /// Request recipes list
  Future<RecipeList> request({required String input}) async {
    final request = await get('search.php', queryParameters: {'s': input});

    if (request.response.statusCode == 200) {
      if (request.json['meals'] != null) {
        return Recipe.fromList(request.json['meals']);
      }
      return [];
    }
    throw Exception();
  }
}
