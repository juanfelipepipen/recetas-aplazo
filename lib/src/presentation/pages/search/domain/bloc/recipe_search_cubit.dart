import 'dart:async';
import 'package:dio/dio.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';

class RecipeSearchCubit extends CubitFetchResolverPending<RecipeList> {
  Timer? _debounceSearch;

  /// Search recipe
  void search(String value) {
    _debounceSearch?.cancel();

    Future<RecipeList> fetcher() async {
      final response = await Dio().get(
        'https://www.themealdb.com/api/json/v1/1/search.php',
        queryParameters: {'s': value},
      );

      if (response.statusCode == 200 && response.data['meals'] != null) {
        if (response.data['meals'] == null) return [];
        return Recipe.fromList(response.data['meals']);
      }
      throw Exception('Not recipe found');
    }

    _debounceSearch = Timer(Duration(seconds: 1), () {
      fetch(fetcher());
    });
  }

  @override
  Future<void> close() {
    _debounceSearch?.cancel();
    return super.close();
  }
}
