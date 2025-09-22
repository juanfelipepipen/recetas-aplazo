part of '../search_page.dart';

class _ResultsListBuilder extends StatelessWidget {
  const _ResultsListBuilder();

  @override
  Widget build(BuildContext context) => BlocBuilderFetchNullable<RecipeSearchCubit, RecipeList>(
    builder: (context, state, bloc, recipes) {
      if (state is FetchLoading || state is FetchSuccess) {
        List<Recipe?> results = [...(recipes ?? [])];

        if (state is FetchLoading) {
          results = [...results, ...Helpers.defaultNulls<Recipe>(3)];
        }

        if (state is FetchSuccess && results.isEmpty) {
          return SearchInfoContainer(
            title: context.localizations.searchNotFound,
            asset: 'assets/img/feeling.png',
          );
        }

        // return ListView.builder(
        //   itemCount: results.length,
        //   itemBuilder: (context, index) => RecipeCard(onLike: bloc.like, recipe: results[index]),
        //   padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        // );
      }

      return SearchInfoContainer(
        title: context.localizations.searchEmptyTitle,
        asset: 'assets/img/barbecue.png',
      );
    },
  );
}
