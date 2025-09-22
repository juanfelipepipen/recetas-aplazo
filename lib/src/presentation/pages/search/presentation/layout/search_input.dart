part of '../search_page.dart';

class _SearchInput extends StatelessWidget {
  const _SearchInput();

  @override
  Widget build(BuildContext context) => BlocBuilderP<RecipeSearchInputCubit, FormuxStringInput>(
    builder: (context, input, bloc) => FormuxTextField(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      label: context.localizations.searchInputLabel,
      input: input,
      onChange: (value) {
        bloc.update(value);
        context.read<RecipeSearchCubit>().search(value);
      },
      suffixIcon: input.value.isNotEmpty
          ? IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                bloc.update('');
                context.read<RecipeSearchCubit>().search('');
              },
            )
          : null,
    ),
  );
}
