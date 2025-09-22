import 'package:equatable/equatable.dart';
import 'package:pipen/extensions.dart';

typedef RecipeIngredient = ({String ingredient, String measure});
typedef RecipeIngredientList = List<RecipeIngredient>;
typedef RecipeList = List<Recipe>;

class Recipe extends Equatable {
  final RecipeIngredientList ingredients;
  final String name, thumb, instructions;
  final String? category, area;
  final bool? like;
  final int id;

  const Recipe({
    this.area,
    this.like,
    this.category,
    required this.id,
    required this.name,
    required this.ingredients,
    required this.thumb,
    required this.instructions,
  });

  /// Get recipe from JSON data
  factory Recipe.fromJson(Map<String, dynamic> json) {
    final RecipeIngredientList ingredients = [];

    /// Get recipe ingredients
    for (int i = 1; i < 20; i++) {
      if (json["strIngredient$i"] != null && json["strIngredient$i"].toString().isNotEmpty) {
        final RecipeIngredient ingredient = (
          ingredient: json["strIngredient$i"],
          measure: json["strMeasure$i"],
        );
        ingredients.add(ingredient);
      } else {
        break;
      }
    }

    return Recipe(
      id: json['idMeal']!.toString().toInt(),
      name: json['strMeal']!.toString(),
      category: json['strCategory']?.toString(),
      area: json['strArea']?.toString(),
      ingredients: ingredients,
      thumb: json['strMealThumb']!.toString(),
      instructions: json['strInstructions']!.toString(),
    );
  }

  /// Get recipes from list
  static RecipeList fromList(List? list) {
    return (list ?? []).map((e) => Recipe.fromJson(e)).toList();
  }

  @override
  List<Object?> get props => [id, like, category, area, name, thumb, instructions];

  Recipe copyWith({
    int? id,
    bool? like,
    String? name,
    String? thumb,
    String? area,
    String? category,
    String? instructions,
    RecipeIngredientList? ingredients,
  }) {
    return Recipe(
      id: id ?? this.id,
      like: like ?? this.like,
      name: name ?? this.name,
      area: area ?? this.area,
      thumb: thumb ?? this.thumb,
      category: category ?? this.category,
      ingredients: ingredients ?? this.ingredients,
      instructions: instructions ?? this.instructions,
    );
  }
}
