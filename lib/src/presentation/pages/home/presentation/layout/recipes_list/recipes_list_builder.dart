part of '../../home_page.dart';

class _RecipesListBuilder extends StatelessWidget {
  _RecipesListBuilder({this.recipes});

  final List<Recipe?> _loaderList = [null, null, null, null];
  final List<Recipe>? recipes;

  @override
  Widget build(BuildContext context) => BlocBuilderFetch<RecipesCubit, RecipeList>(
    builder: (context, state, bloc) => BlocBuilderP<RecipesListCubit, RecipeList>(
      builder: (context, recipes, recipesListBloc) {
        List<Recipe?> list = [...recipes];
        if (state is FetchLoading) list = [...list, ..._loaderList];
        if (state is FetchSuccess && bloc.fetchable) list = [...list, null];

        return ListView.builder(
          itemCount: list.length,
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          itemBuilder: (context, index) {
            final isEnd = index == list.length - 1;
            if (isEnd && state is FetchSuccess) {
              return _RecipesLoadMoreButton();
            }
            return RecipeCard(
              onChange: recipesListBloc.update,
              onLike: recipesListBloc.like,
              recipe: list[index],
            );
          },
        );
      },
    ),
  );
}
