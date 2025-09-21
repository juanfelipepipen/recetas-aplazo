part of '../../home_page.dart';

class _RecipesListBuilder extends StatefulWidget {
  const _RecipesListBuilder({this.recipes});

  final List<Recipe>? recipes;

  @override
  State<_RecipesListBuilder> createState() => _RecipesListBuilderState();
}

class _RecipesListBuilderState extends State<_RecipesListBuilder> {
  List<Recipe?> _loaderList = [null, null, null, null];

  @override
  Widget build(BuildContext context) => BlocBuilderFetch<RecipesCubit, RecipeList>(
    builder: (context, state, bloc) => BlocBuilder<RecipesListCubit, RecipeList>(
      builder: (context, recipes) {
        List<Recipe?> list = [...recipes];
        if (state is FetchLoading) list = [...list, ..._loaderList];

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => RecipeCard(recipe: list[index]),
        );
      },
    ),
  );
}
