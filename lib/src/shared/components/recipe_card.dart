import 'package:recetas_aplazo/src/shared/components/recipe_like_button.dart';
import 'package:recetas_aplazo/src/shared/router/routes/recipe_route.dart';
import 'package:recetas_aplazo/src/shared/components/recipe_chip.dart';
import 'package:recetas_aplazo/src/extensions/context_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:flutter/material.dart';
import 'package:pipen/components.dart';
import 'package:pipen/extensions.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key, required this.recipe, required this.onLike, required this.onChange});

  final Future<bool?> Function(int id, bool current) onLike;
  final OnRecipe onChange;
  final Recipe? recipe;

  bool get _isLoading => recipe == null;

  @override
  Widget build(BuildContext context) => PipenRow(
    spacing: 20,
    vertical: CrossAxisAlignment.center,
    padding: EdgeInsets.symmetric(vertical: 14),
    children: [
      SizedBox(
        width: context.width * 0.2,
        height: context.width * 0.2,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            PipenSkeletonizer(
              loading: _isLoading,
              child: recipe != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: recipe!.thumb,
                        placeholder: (context, url) => PipenSkeletonizer(
                          loading: true,
                          child: SizedBox(height: double.infinity, width: double.infinity),
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: PipenColumn.center(
                            spacing: PipenGap.verySmallSize,
                            children: [
                              Icon(Icons.error, color: context.themeColors.error),
                              Text(
                                textAlign: TextAlign.center,
                                context.localizations.componentRecipeCardErrorImage,
                                style: context.textTheme.labelSmall?.copyWith(letterSpacing: 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black,
                      ),
                    ),
            ),
            Positioned(
              top: -10,
              right: -10,
              child: RecipeLikeButton(
                size: 24,
                filled: true,
                recipeId: recipe?.id,
                isLiked: recipe?.like,
                alignment: Alignment.topRight,
                onTap: (current) async {
                  if (recipe?.id case int id) {
                    return onLike(id, current);
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
      Expanded(
        child: PipenColumn(
          spacing: 4,
          children: [
            PipenTextSkeleton(
              skeletonWith: context.width * 0.6,
              value: recipe?.name,
              style: context.textTheme.titleMedium,
            ),
            if (recipe?.area != null && recipe?.category != null)
              PipenRow(
                spacing: 10,
                children: [
                  RecipeChip(title: recipe!.area!),
                  RecipeChip(title: recipe!.category!),
                ],
              ),
          ],
        ),
      ),
      PipenSkeletonizer(
        loading: _isLoading,
        child: IconButton(
          icon: Icon(Icons.keyboard_arrow_right_sharp),
          onPressed: () {
            if (recipe != null) {
              RecipeRoute(recipeId: recipe!.id, onChange: onChange).push(context);
            }
          },
        ),
      ),
    ],
  );
}
