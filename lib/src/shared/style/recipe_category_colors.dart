import 'package:flutter/material.dart';

class RecipeCategoryColors {
  static final List<_CategoryStyle> _colors = [
    _CategoryStyle(values: ['dessert', 'meat'], color: Color.fromRGBO(35, 155, 167, 1)),
    _CategoryStyle(values: ['beef', 'meat'], color: Color.fromRGBO(51, 56, 160, 1)),
    _CategoryStyle(values: ['chicken', 'fish'], color: Color.fromRGBO(106, 0, 102, 1)),
    _CategoryStyle(values: ['vegetarian'], color: Color.fromRGBO(51, 150, 211, 1)),
    _CategoryStyle(values: ['dessert', 'sweet'], color: Color.fromRGBO(86, 130, 177, 1)),
    _CategoryStyle(values: ['british', 'english'], color: Color.fromRGBO(225, 170, 54, 1)),
    _CategoryStyle(values: ['italian'], color: Color.fromRGBO(556, 102, 65, 1)),
    _CategoryStyle(values: ['mexican'], color: Color.fromRGBO(111, 0, 255, 1)),
    _CategoryStyle(values: ['indian'], color: Color.fromRGBO(59, 2, 112, 1)),
    _CategoryStyle(values: ['chinese'], color: Color.fromRGBO(0, 11, 88, 1)),
    _CategoryStyle(values: ['japanese'], color: Color.fromRGBO(0, 49, 97, 1)),
    _CategoryStyle(values: ['french'], color: Color.fromRGBO(0, 106, 103, 1)),
    _CategoryStyle(values: ['thai'], color: Color.fromRGBO(253, 244, 227, 1)),
  ];

  static Color get(String? category) {
    final defaultValue = _CategoryStyle(values: [], color: Colors.black);

    if (category == null) {
      return defaultValue.color;
    }

    final style = _colors.firstWhere(
      (element) => element.values.contains(category.toLowerCase()),
      orElse: () => defaultValue,
    );
    return style.color;
  }
}

class _CategoryStyle {
  List<String> values;
  Color color;

  _CategoryStyle({required this.values, required this.color});
}
