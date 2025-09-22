import 'package:objectbox/objectbox.dart';

typedef RecipeLikeList = List<RecipeLike>;

@Entity()
class RecipeLike {
  @Id()
  int id;

  int recipeId;

  RecipeLike({this.id = 0, required this.recipeId});
}
