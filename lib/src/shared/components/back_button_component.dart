import 'package:flutter/material.dart';
import 'package:pipen/extensions.dart';

class BackButtonComponent extends StatelessWidget {
  const BackButtonComponent({super.key, this.color, this.safeTop, this.safeLeft = true});

  final Color? color;
  final bool? safeTop;
  final bool safeLeft;

  @override
  Widget build(BuildContext context) => SafeArea(
    top: safeTop ?? true,
    bottom: false,
    child: Padding(
      padding: EdgeInsets.only(left: safeLeft ? 20 : 0),
      child: IconButton.filled(
        onPressed: Navigator.of(context).pop,
        color: color ?? context.themeColors.primary,
        icon: Icon(Icons.arrow_back, color: Colors.black),
      ),
    ),
  );
}
