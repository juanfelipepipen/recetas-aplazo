part of '../search_page.dart';

class _ResultsListLayout extends StatelessWidget {
  const _ResultsListLayout();

  @override
  Widget build(BuildContext context) => ContainerBorderedComponent(
    child: PipenColumn(
      children: [
        BackButtonComponent(color: Colors.white, safeTop: false, safeLeft: false),
        _SearchInput(),
        Center(
          child: PipenColumn.center(
            padding: EdgeInsets.only(top: PipenGap.largeSize),
            spacing: PipenGap.smallSize,
            children: [
              Image.asset('assets/img/barbecue.png', width: context.width * 0.6),
              Text(context.localizations.searchEmptyTitle, style: context.textTheme.titleMedium),
            ],
          ),
        ),
      ],
    ),
  );
}
