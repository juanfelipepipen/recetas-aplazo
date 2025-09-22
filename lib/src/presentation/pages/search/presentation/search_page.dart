import 'package:recetas_aplazo/src/presentation/pages/search/presentation/components/search_info_container.dart';
import 'package:recetas_aplazo/src/presentation/pages/search/domain/bloc/recipe_search_input_cubit.dart';
import 'package:recetas_aplazo/src/presentation/pages/search/domain/bloc/recipe_search_cubit.dart';
import 'package:recetas_aplazo/src/presentation/components/container_bordered_component.dart';
import 'package:recetas_aplazo/src/presentation/components/header_gradient_component.dart';
import 'package:recetas_aplazo/src/presentation/components/back_button_component.dart';
import 'package:recetas_aplazo/src/presentation/components/recipe_card.dart';
import 'package:recetas_aplazo/src/extensions/context_extension.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/core/helpers.dart';
import 'package:flutter_formux/flutter_formux.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:pipen/components.dart';
import 'package:pipen/extensions.dart';

part 'layout/header.dart';
part 'layout/search_input.dart';
part 'layout/results_list_layout.dart';
part 'layout/results_list_builder.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => RecipeSearchCubit()),
      BlocProvider(create: (_) => RecipeSearchInputCubit()),
    ],
    child: Scaffold(
      body: PipenGestureDismissKeyboard(
        child: HeaderGradientComponent(
          child: PipenColumn(
            children: [
              _Header(),
              Expanded(child: _ResultsListLayout()),
            ],
          ),
        ),
      ),
    ),
  );
}
