part of '../home_page.dart';

class _RecipesList extends StatelessWidget {
  const _RecipesList();

  @override
  Widget build(BuildContext context) => BlocBuilderFetch<RecipesCubit, RecipeList>(
    builder: (context, state, bloc) => Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      padding: EdgeInsets.only(left: 30, right: 30, top: 30),
      child: PipenColumn(
        children: [
          Text(
            context.localizations.homeRecipes,
            style: context.textTheme.titleLarge?.copyWith(letterSpacing: 1),
          ),
          Expanded(child: ListView.builder(itemBuilder: (context, index) => RecipeCard())),
        ],
      ),
    ),
  );
}
