import 'package:pipen/extensions.dart';

typedef RecipeIngredient = ({String ingredient, String measure});
typedef RecipeIngredientList = List<RecipeIngredient>;
typedef RecipeList = List<Recipe>;

class Recipe {
  final String name, category, area, thumb, instructions;
  final List<RecipeIngredient> ingredients;
  final int id;

  Recipe({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.ingredients,
    required this.thumb,
    required this.instructions,
  });

  /// Get recipe from JSON data
  factory Recipe.fromJson(Map<String, dynamic> json) {
    final RecipeIngredientList ingredients = [];

    /// Get recipe ingredients
    for (int i = 1; i < 20; i++) {
      if (json["strIngredient$i}"] != null && json["strIngredient$i}"].toString().isNotEmpty) {
        final RecipeIngredient ingredient = (
          ingredient: json["strIngredient$i}"],
          measure: json["strMeasure$i}"],
        );
        ingredients.add(ingredient);
      } else {
        break;
      }
    }

    return Recipe(
      id: json['idMeal']!.toString().toInt(),
      name: json['strMeal']!.toString(),
      category: json['strCategory']!.toString(),
      area: json['strArea']!.toString(),
      ingredients: ingredients,
      thumb: json['strMealThumb']!.toString(),
      instructions: json['strInstructions']!.toString(),
    );
  }

  /// Get recipes from list
  static RecipeList fromList(List? list) {
    return (list ?? []).map((e) => Recipe.fromJson(e)).toList();
  }
}
