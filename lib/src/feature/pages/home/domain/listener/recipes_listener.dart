import 'package:recetas_aplazo/src/feature/pages/home/domain/bloc/recipes_list_cubit.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pipen_bloc/pipen_bloc.dart';

class RecipesListener extends BlocListenFetch<RecipeList> {
  @override
  get success => context.read<RecipesListCubit>().add;
}
