import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  RecipesCubit() : super(RecipesInitial());
}
