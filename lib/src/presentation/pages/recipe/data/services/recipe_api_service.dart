import 'package:recetas_aplazo/src/shared/dio/dio_service.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';

class RecipeApiService extends DioService {
  /// Request recipes list
  Future<Recipe> request({required int recipeId}) async {
    final response = await get('lookup.php', queryParameters: {'i': recipeId});
    if (response.response.statusCode == 200 && response.json['meals'] != null) {
      final List meals = response.json['meals'];
      if (meals.isNotEmpty) {
        return Recipe.fromJson(meals.first);
      }
    }
    throw Exception('Not recipe found');
  }
}
