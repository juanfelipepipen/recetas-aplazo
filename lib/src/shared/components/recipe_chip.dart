import 'package:flutter/material.dart';
import 'package:pipen/components.dart';
import 'package:pipen/extensions.dart';
import 'package:recetas_aplazo/src/shared/style/recipe_category_colors.dart';

class RecipeChip extends StatelessWidget {
  const RecipeChip({super.key, required this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    final styleColor = RecipeCategoryColors.get(title);
    return PipenRow.min(
      child: PipenSkeletonizer(
        loading: title == null,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: styleColor),
            borderRadius: BorderRadius.circular(20),
            color: title == null ? Colors.black : styleColor.withValues(alpha: 0.6),
          ),
          child: Text(title ?? 'Category', style: context.textTheme.labelSmall),
        ),
      ),
    );
  }
}
