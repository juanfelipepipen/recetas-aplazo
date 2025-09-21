import 'package:dio/dio.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';

class RecipesCubit extends CubitFetch<RecipeList> {
  RecipesCubit()
    : _letters = List.generate(_maxLetters, (i) => String.fromCharCode('a'.codeUnitAt(0) + i));

  static const int _maxLetters = 26;
  final List<String> _letters;
  int _lastChar = -1;

  bool get fetchable => _lastChar != _maxLetters;

  @override
  get resolver async {
    _lastChar++;
    if (_lastChar > _maxLetters) _lastChar = 0;

    final letter = _letters[_lastChar];
    final response = await Dio().get(
      "https://www.themealdb.com/api/json/v1/1/search.php?f=$letter",
    );
    return Recipe.fromList(response.data['meals']);
  }
}
