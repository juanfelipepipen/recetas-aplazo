import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:dio/dio.dart';

class RecipeDetailBloc extends CubitFetch<Recipe> {
  RecipeDetailBloc({required this.recipeId});

  final int recipeId;

  @override
  get resolver async {
    final response = await Dio().get(
      'https://www.themealdb.com/api/json/v1/1/lookup.php',
      queryParameters: {'i': recipeId},
    );
    if (response.statusCode == 200 && response.data['meals'] != null) {
      final List meals = response.data['meals'];
      if (meals.isNotEmpty) {
        return Recipe.fromJson(meals.first);
      }
    }
    throw Exception('Not recipe found');
  }
}
