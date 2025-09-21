import 'package:flutter/material.dart';

class RecipeChip extends StatelessWidget {
  const RecipeChip({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) => Container(child: Text(title));
}
