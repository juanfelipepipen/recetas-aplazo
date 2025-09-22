part of '../../home_page.dart';

class _RecipesList extends StatelessWidget {
  const _RecipesList();

  @override
  Widget build(BuildContext context) => BlocBuilderFetchNullable<RecipesCubit, RecipeList>(
    builder: (context, state, bloc, recipes) => ContainerBorderedComponent(
      child: PipenColumn(
        children: [
          PipenRow(
            vertical: CrossAxisAlignment.center,
            children: [
              Text(
                context.localizations.homeRecipes,
                style: context.textTheme.titleLarge?.copyWith(letterSpacing: 1),
              ),
              Spacer(),
              IconButton(onPressed: () => SearchRoute().push(context), icon: Icon(Icons.search)),
            ],
          ),
          Expanded(child: _RecipesListBuilder(recipes: recipes)),
        ],
      ),
    ),
  );
}
