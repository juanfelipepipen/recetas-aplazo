import 'package:recetas_aplazo/src/presentation/pages/home/domain/repository/home_repository.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:pipen_bloc/pipen_bloc.dart';

class RecipesCubit extends CubitFetch<RecipeList> {
  RecipesCubit({required HomeRepository repository})
    : _letters = List.generate(_maxLetters, (i) => String.fromCharCode('a'.codeUnitAt(0) + i)),
      _repository = repository;

  final HomeRepository _repository;
  final List<String> _letters;

  static const int _maxLetters = 26;

  int _lastChar = 0;

  bool get fetchable => _lastChar != _maxLetters;

  @override
  get resolver async {
    final char = _letters[_lastChar];
    final recipes = await _repository.getRecipes(char: char);
    _lastChar++;
    if (_lastChar > _maxLetters) _lastChar = 0;
    return recipes;
  }
}
