part of '../recipe_page.dart';

class _LayoutView extends StatelessWidget {
  const _LayoutView();

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      BlocFetchFailedBuilder<RecipeDetailBloc, Recipe>(
        title: context.localizations.recipeLoadError,
        onPressed: context.read<RecipeDetailBloc>().fetch,
        child: PipenColumn(
          children: [
            Stack(
              children: [
                /// Recipe image layout
                _RecipeThumbLayout(),
              ],
            ),

            /// Recipe details info layout
            Expanded(child: SafeArea(top: false, child: _RecipeDetailsLayout())),
          ],
        ),
      ),

      /// Back button
      BackButtonComponent(),
    ],
  );
}
