import 'package:recetas_aplazo/src/feature/pages/recipe/domain/repository/recipe_repository.dart';
import 'package:recetas_aplazo/src/feature/pages/recipe/domain/bloc/recipe_detail_bloc.dart';
import 'package:recetas_aplazo/src/feature/pages/recipe/domain/recipe_detail_listener.dart';
import 'package:recetas_aplazo/src/shared/components/bloc_fetch_failed_builder.dart';
import 'package:recetas_aplazo/src/shared/components/back_button_component.dart';
import 'package:recetas_aplazo/src/shared/components/recipe_like_button.dart';
import 'package:recetas_aplazo/src/extensions/context_extension.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/core/helpers.dart';
import 'package:recetas_aplazo/src/shared/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pipen/components.dart';
import 'package:pipen/extensions.dart';

part 'layout/layout_view.dart';
part 'layout/recipe_thumb_layout.dart';
part 'layout/recipe_details_layout.dart';

typedef _RecipeDetailBuilder = BlocBuilderFetchNullable<RecipeDetailBloc, Recipe>;

class RecipePage extends StatelessWidget {
  const RecipePage({super.key, required this.recipeId, required this.onChange});

  final OnRecipe onChange;
  final int recipeId;

  @override
  Widget build(BuildContext context) => BlocProvider<RecipeDetailBloc>(
    create: (_) => RecipeDetailBloc(recipeId: recipeId, repository: locator<RecipeRepository>()),
    child: BlocListenerFetch<RecipeDetailBloc, Recipe>(
      listener: RecipeDetailListener(onChange: onChange),
      child: Scaffold(body: _LayoutView()),
    ),
  );
}
