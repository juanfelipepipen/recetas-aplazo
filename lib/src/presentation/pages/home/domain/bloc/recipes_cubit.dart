import 'package:dio/dio.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';

class RecipesCubit extends CubitFetch<RecipeList> {
  @override
  get resolver async {
    final response = await Dio().get('https://www.themealdb.com/api/json/v1/1/search.php?f=a');
    return Recipe.fromList(response.data['meals']);
  }
}
