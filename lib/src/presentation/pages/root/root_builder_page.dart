import 'package:flutter/material.dart';
import 'package:pipen/extensions.dart';

class RootBuilderPage extends StatelessWidget {
  const RootBuilderPage({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Theme(
    data: context.theme.copyWith(
      primaryColor: Color.fromRGBO(0, 1238, 252, 1),
      colorScheme: context.theme.colorScheme.copyWith(primary: Color.fromRGBO(0, 1238, 252, 1)),
    ),
    child: child,
  );
}
