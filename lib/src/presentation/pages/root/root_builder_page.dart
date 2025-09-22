import 'package:flutter/material.dart';
import 'package:flutter_formux/flutter_formux.dart';
import 'package:pipen/extensions.dart';

class RootBuilderPage extends StatefulWidget {
  const RootBuilderPage({super.key, required this.child});

  final Widget child;

  @override
  State<RootBuilderPage> createState() => _RootBuilderPageState();
}

class _RootBuilderPageState extends State<RootBuilderPage> {
  @override
  void didChangeDependencies() {
    formuxLocalization = FormuxLocalization.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Theme(
    data: context.theme.copyWith(
      primaryColor: Color.fromRGBO(0, 1238, 252, 1),
      colorScheme: context.theme.colorScheme.copyWith(primary: Color.fromRGBO(0, 1238, 252, 1)),
    ),
    child: widget.child,
  );
}
