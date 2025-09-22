import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class RecipeSearchCubit extends CubitFetchResolverPending<RecipeList> {
  Timer? _debounceSearch;

  /// Search recipe
  void search(String value) {
    _debounceSearch?.cancel();

    if (value.isEmpty) {
      return emit(FetchPending<RecipeList>());
    }

    Future<RecipeList> fetcher() async {
      final response = await Dio().get(
        'https://www.themealdb.com/api/json/v1/1/search.php',
        queryParameters: {'s': value},
      );

      if (response.statusCode == 200) {
        if (response.data['meals'] != null) {
          return Recipe.fromList(response.data['meals']);
        }
        return [];
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
