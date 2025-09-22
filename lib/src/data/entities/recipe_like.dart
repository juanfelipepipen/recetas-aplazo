import 'package:objectbox/objectbox.dart';

@Entity()
class RecipeLike {
  @Id()
  int id;

  int recipeId;

  RecipeLike({this.id = 0, required this.recipeId});
}
