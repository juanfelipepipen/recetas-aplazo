import 'package:objectbox/objectbox.dart';
import 'package:recetas_aplazo/src/data/entities/recipe_box.dart';

@Entity()
class RecipeIngredientBox {
  String ingredient, measure;

  final recipe = ToOne<RecipeBox>();

  @Id()
  int id;

  RecipeIngredientBox({this.id = 0, required this.ingredient, required this.measure});
}
