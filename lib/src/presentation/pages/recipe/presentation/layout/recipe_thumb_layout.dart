part of '../recipe_page.dart';

class _RecipeThumbLayout extends StatelessWidget {
  const _RecipeThumbLayout();

  @override
  Widget build(BuildContext context) => _RecipeDetailBuilder(
    builder: (context, state, bloc, recipe) => SizedBox(
      height: context.height * 0.4,
      width: double.infinity,
      child: PipenSkeletonizer(
        state: state,
        child: recipe == null
            ? Container(color: Colors.black, width: double.infinity, height: double.infinity)
            : Image.network(
                recipe.thumb,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
      ),
    ),
  );
}
