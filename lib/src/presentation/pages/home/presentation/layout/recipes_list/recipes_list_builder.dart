part of '../../home_page.dart';

class _RecipesListBuilder extends StatefulWidget {
  const _RecipesListBuilder({this.recipes});

  final List<Recipe>? recipes;

  @override
  State<_RecipesListBuilder> createState() => _RecipesListBuilderState();
}

class _RecipesListBuilderState extends State<_RecipesListBuilder> {
  final List<Recipe?> _loaderList = [null, null, null, null];

  @override
  Widget build(BuildContext context) => BlocBuilderFetch<RecipesCubit, RecipeList>(
    builder: (context, state, bloc) => BlocBuilder<RecipesListCubit, RecipeList>(
      builder: (context, recipes) {
        List<Recipe?> list = [...recipes];
        if (state is FetchLoading) list = [...list, ..._loaderList];
        if (state is FetchSuccess && bloc.fetchable) list = [...list, null];

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final isEnd = index == list.length - 1;
            if (isEnd && state is FetchSuccess) {
              return _LoadMoreButton();
            }

            return RecipeCard(recipe: list[index]);
          },
        );
      },
    ),
  );
}

class _LoadMoreButton extends StatelessWidget {
  const _LoadMoreButton();

  @override
  Widget build(BuildContext context) => FilledButton.icon(
    icon: Icon(Icons.add),
    onPressed: context.read<RecipesCubit>().fetch,
    label: Text(
      context.localizations.homeLoadMoreButtonTitle,
      style: TextStyle(color: Colors.black),
    ),
    style: FilledButton.styleFrom(
      iconColor: Colors.black,
      iconAlignment: IconAlignment.end,
      backgroundColor: context.themeColors.primary,
    ),
  );
}
