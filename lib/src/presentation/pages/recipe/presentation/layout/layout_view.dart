part of '../recipe_page.dart';

class _LayoutView extends StatelessWidget {
  const _LayoutView();

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      BlocFetchFailedBuilder<RecipeDetailBloc, Recipe>(
        title: context.localizations.recipeLoadError,
        onPressed: context.read<RecipeDetailBloc>().fetch,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.transparent,
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.none,
                background: _RecipeThumbLayout(),
              ),
            ),
            SliverFillRemaining(
              fillOverscroll: true,
              hasScrollBody: false,
              child: _RecipeDetailsLayout(),
            ),
          ],
        ),
      ),

      /// Back button
      BackButtonComponent(),
    ],
  );
}
