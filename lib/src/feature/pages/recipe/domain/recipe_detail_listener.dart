import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:pipen_bloc/pipen_bloc.dart';

class RecipeDetailListener extends BlocListenFetch<Recipe> {
  RecipeDetailListener({required this.onChange});

  final OnRecipe onChange;

  @override
  get success => onChange;
}
