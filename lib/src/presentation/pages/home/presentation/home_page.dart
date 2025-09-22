import 'package:recetas_aplazo/src/presentation/pages/home/domain/listener/recipes_listener.dart';
import 'package:recetas_aplazo/src/presentation/pages/home/domain/bloc/recipes_list_cubit.dart';
import 'package:recetas_aplazo/src/presentation/components/container_bordered_component.dart';
import 'package:recetas_aplazo/src/presentation/components/header_gradient_component.dart';
import 'package:recetas_aplazo/src/presentation/pages/home/domain/bloc/recipes_cubit.dart';
import 'package:recetas_aplazo/src/presentation/router/routes/search_route.dart';
import 'package:recetas_aplazo/src/presentation/components/recipe_card.dart';
import 'package:recetas_aplazo/src/extensions/context_extension.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/shared/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pipen/components.dart';
import 'package:pipen/extensions.dart';

part 'layout/header.dart';
part 'layout/recipes_list/recipes_list.dart';
part 'layout/recipes_list/recipes_list_builder.dart';
part 'layout/recipes_list/recipes_load_more_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => locator<RecipesCubit>()),
      BlocProvider(create: (_) => RecipesListCubit()),
    ],
    child: MultiBlocProvider(
      providers: [BlocListenerFetch<RecipesCubit, RecipeList>(listener: RecipesListener())],
      child: Scaffold(
        body: HeaderGradientComponent(
          child: Column(
            children: [
              _Header(),
              Expanded(child: _RecipesList()),
            ],
          ),
        ),
      ),
    ),
  );
}
