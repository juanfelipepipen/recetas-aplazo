import 'package:flutter_formux/flutter_formux.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeSearchInputCubit extends Cubit<FormuxStringInput> {
  RecipeSearchInputCubit() : super(FormuxStringInput());

  /// Update search value
  void update(String value) {
    emit(state.copyWith(value: value));
  }
}
