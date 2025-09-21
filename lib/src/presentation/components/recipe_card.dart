import 'package:flutter/material.dart';
import 'package:pipen/components.dart';
import 'package:pipen/extensions.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/presentation/components/recipe_chip.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) => Card(
    color: Colors.white,
    child: PipenRow(
      spacing: 20,
      vertical: CrossAxisAlignment.center,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
      ],
    ),
  );
}
