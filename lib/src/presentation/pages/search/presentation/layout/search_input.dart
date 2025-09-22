part of '../search_page.dart';

class _SearchInput extends StatelessWidget {
  const _SearchInput();

  @override
  Widget build(BuildContext context) => BlocBuilderP<RecipeSearchInputCubit, FormuxStringInput>(
    builder: (context, input, bloc) => FormuxTextField(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      label: context.localizations.searchInputLabel,
      onChange: (value) {
        bloc.update(value);
        context.read<RecipeSearchCubit>().search(value);
      },
      input: input,
    ),
  );
}
