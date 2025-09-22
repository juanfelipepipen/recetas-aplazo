import 'package:flutter/material.dart';

class ContainerBorderedComponent extends StatelessWidget {
  const ContainerBorderedComponent({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
    ),
    padding: EdgeInsets.only(left: 30, right: 30, top: 30),
    child: child,
  );
}
