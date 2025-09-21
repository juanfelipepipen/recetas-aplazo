part of '../home_page.dart';

class _RecipesList extends StatelessWidget {
  const _RecipesList();

  @override
  Widget build(BuildContext context) => BlocBuilderFetchNullable<RecipesCubit, RecipeList>(
    builder: (context, state, bloc, recipes) => Container(
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
          PipenRow(
            vertical: CrossAxisAlignment.center,
            children: [
              Text(
                context.localizations.homeRecipes,
                style: context.textTheme.titleLarge?.copyWith(letterSpacing: 1),
              ),

              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: (recipes ?? []).length,
              itemBuilder: (context, index) => RecipeCard(recipe: (recipes ?? [])[index]),
            ),
          ),
        ],
      ),
    ),
  );
}
