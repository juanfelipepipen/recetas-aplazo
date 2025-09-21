import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pipen/components.dart';
import 'package:pipen/extensions.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/extensions/context_extension.dart';
import 'package:recetas_aplazo/src/presentation/components/recipe_card.dart';
import 'package:recetas_aplazo/src/presentation/pages/home/domain/bloc/recipes_cubit.dart';

part 'layout/header.dart';
part 'layout/recipes_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
    providers: [BlocProvider(create: (_) => RecipesCubit())],
    child: Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(0, 238, 252, 1),
              Color.fromRGBO(87, 199, 133, 1),
              Color.fromRGBO(237, 221, 83, 1),
            ],
          ),
        ),
        child: Column(
          children: [
            _Header(),
            Expanded(child: _RecipesList()),
          ],
        ),
      ),
    ),
  );
}
