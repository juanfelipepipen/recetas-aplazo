import 'package:recetas_aplazo/src/presentation/pages/recipe/domain/bloc/recipe_detail_bloc.dart';
import 'package:recetas_aplazo/src/presentation/components/back_button_component.dart';
import 'package:recetas_aplazo/src/extensions/context_extension.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/core/helpers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pipen/components.dart';
import 'package:pipen/extensions.dart';
import 'package:recetas_aplazo/src/presentation/pages/recipe/domain/repository/recipe_repository.dart';
import 'package:recetas_aplazo/src/shared/di/di.dart';

part 'layout/recipe_details_layout.dart';
part 'layout/recipe_thumb_layout.dart';

typedef _RecipeDetailBuilder = BlocBuilderFetchNullable<RecipeDetailBloc, Recipe>;

class RecipePage extends StatelessWidget {
  const RecipePage({super.key, required this.recipeId});

  final int recipeId;

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) =>
            RecipeDetailBloc(recipeId: recipeId, repository: locator<RecipeRepository>()),
      ),
    ],
    child: Scaffold(
      body: PipenColumn(
        children: [
          Stack(
            children: [
              /// Recipe image layout
              _RecipeThumbLayout(),

              /// Back button
              BackButtonComponent(),
            ],
          ),

          /// Recipe details info layout
          Expanded(child: SafeArea(top: false, child: _RecipeDetailsLayout())),
        ],
      ),
    ),
  );
}
