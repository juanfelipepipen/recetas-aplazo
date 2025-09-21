import 'package:flutter/material.dart';
import 'package:pipen/components.dart';
import 'package:pipen/extensions.dart';
import 'package:recetas_aplazo/src/extensions/context_extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(0, 238, 252, 1),
            Color.fromRGBO(87, 199, 133, 1),
            Color.fromRGBO(237, 221, 83, 1),
          ],
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: context.height * 0.3,
            child: PipenColumn.center(
              children: [
                Text(
                  context.localizations.homeGreetings,
                  style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.7,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.only(left: 30, right: 30, top: 30),
              child: PipenColumn(
                children: [
                  Text(
                    context.localizations.homeRecipes,
                    style: context.textTheme.titleLarge?.copyWith(letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
