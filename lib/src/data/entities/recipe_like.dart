import 'package:objectbox/objectbox.dart';
import 'package:recetas_aplazo/src/data/entities/recipe_box.dart';

@Entity()
class RecipeLike {
  final recipe = ToOne<RecipeBox>();

  @Id()
  int id;

  RecipeLike({this.id = 0});
}
