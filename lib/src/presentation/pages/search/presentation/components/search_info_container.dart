import 'package:flutter/cupertino.dart';
import 'package:pipen/components.dart';
import 'package:pipen/extensions.dart';

class SearchInfoContainer extends StatelessWidget {
  const SearchInfoContainer({super.key, required this.title, required this.asset});

  final String title, asset;

  @override
  Widget build(BuildContext context) => Center(
    child: PipenColumn.center(
      spacing: PipenGap.smallSize,
      padding: EdgeInsets.only(bottom: context.height * 0.15),
      children: [
        Image.asset(asset, width: context.width * 0.6),
        Text(title, style: context.textTheme.titleMedium),
      ],
    ),
  );
}
