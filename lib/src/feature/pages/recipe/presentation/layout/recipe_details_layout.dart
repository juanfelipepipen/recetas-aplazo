part of '../recipe_page.dart';

class _RecipeDetailsLayout extends StatelessWidget {
  const _RecipeDetailsLayout();

  @override
  Widget build(BuildContext context) => _RecipeDetailBuilder(
    builder: (context, state, bloc, recipe) => PipenColumn(
      padding: EdgeInsets.only(left: 30, right: 30, top: 40),
      spacing: PipenGap.separatorSize,
      children: [
        /// Recipe title & like
        PipenRow(
          spacing: PipenGap.smallSize,
          vertical: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PipenTextSkeleton(
                value: recipe?.name,
                skeletonWith: context.width,
                style: context.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),

            /// Like recipe
            RecipeLikeButton(recipeId: recipe?.id, isLiked: recipe?.like, onTap: bloc.like),
          ],
        ),

        /// Recipe category & area
        Wrap(
          direction: Axis.horizontal,
          spacing: PipenGap.verySmallSize,
          children: [
            RecipeChip(title: recipe?.area),
            RecipeChip(title: recipe?.category),
          ],
        ),

        /// Ingredients list
        PipenRow(
          spacing: PipenGap.smallSize,
          vertical: CrossAxisAlignment.center,
          children: [
            Icon(Icons.local_grocery_store, color: Colors.red),
            Text(
              context.localizations.recipeIngredients,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
          ],
        ),

        PipenColumn(
          children: (recipe?.ingredients ?? Helpers.defaultNulls<RecipeIngredient>(10))
              .map(
                (e) => PipenRow(
                  spacing: 10,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8),
                      child: Icon(Icons.circle, size: 8, color: Colors.red.withValues(alpha: 0.4)),
                    ),
                    PipenTextSkeleton(
                      skeletonWith: context.width * 0.8,
                      value: e != null ? ('${e.ingredient}, ${e.measure}') : null,
                      style: context.textTheme.bodyLarge,
                    ),
                  ],
                ),
              )
              .toList(),
        ),

        /// Instructions
        PipenRow(
          vertical: CrossAxisAlignment.center,
          spacing: PipenGap.smallSize,
          children: [
            Icon(Icons.featured_play_list, color: Colors.teal),
            Text(
              context.localizations.recipeInstructions,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        PipenTextSkeleton(
          skeletonWith: context.width,
          value: recipe?.instructions,
          style: context.textTheme.bodyLarge?.copyWith(letterSpacing: 0),
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom),
      ],
    ),
  );
}
