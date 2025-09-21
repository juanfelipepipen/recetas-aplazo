import 'package:flutter/material.dart';
import 'package:pipen/components.dart';
import 'package:pipen/extensions.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/presentation/components/recipe_chip.dart';
import 'package:recetas_aplazo/src/presentation/router/routes/recipe_route.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) => PipenRow(
    spacing: 20,
    vertical: CrossAxisAlignment.center,
    padding: EdgeInsets.symmetric(vertical: 14),
    children: [
      SizedBox(
        width: context.width * 0.2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(recipe.thumb, fit: BoxFit.cover),
        ),
      ),
      Expanded(
        child: PipenColumn(
          spacing: 4,
          children: [
            Text(recipe.name, style: context.textTheme.titleMedium),
            if (recipe.area != null && recipe.category != null)
              PipenRow(
                spacing: 10,
                children: [
                  RecipeChip(title: recipe.area!),
                  RecipeChip(title: recipe.category!),
                ],
              ),
          ],
        ),
      ),
      IconButton(
        onPressed: () {
          if (recipe != null) {
            RecipeRoute(recipeId: recipe.id).push(context);
          }
        },
        icon: Icon(Icons.keyboard_arrow_right_sharp),
      ),
    ],
  );
}
