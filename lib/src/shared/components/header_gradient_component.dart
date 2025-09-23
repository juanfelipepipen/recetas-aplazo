import 'package:flutter/cupertino.dart';

class HeaderGradientComponent extends StatelessWidget {
  const HeaderGradientComponent({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Container(
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
    child: child,
  );
}
