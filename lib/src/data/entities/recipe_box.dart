import 'package:objectbox/objectbox.dart';
import 'package:recetas_aplazo/src/data/entities/recipe_ingredient_box.dart';

@Entity()
class RecipeBox {
  String name, thumb, instructions;
  String? category, area;

  @Backlink('recipe')
  final ingredients = ToMany<RecipeIngredientBox>();

  @Id()
  int id;

  RecipeBox({
    this.id = 0,
    this.area,
    this.category,
    required this.name,
    required this.thumb,
    required this.instructions,
  });
}
