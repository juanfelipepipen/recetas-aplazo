part of '../../home_page.dart';

class _RecipesLoadMoreButton extends StatelessWidget {
  const _RecipesLoadMoreButton();

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
