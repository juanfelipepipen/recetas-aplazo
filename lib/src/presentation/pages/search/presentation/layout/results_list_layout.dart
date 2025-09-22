part of '../search_page.dart';

class _ResultsListLayout extends StatelessWidget {
  const _ResultsListLayout();

  @override
  Widget build(BuildContext context) => ContainerBorderedComponent(
    child: PipenColumn(
      children: [
        BackButtonComponent(color: Colors.white, safeTop: false, safeLeft: false),
        _SearchInput(),
        Expanded(child: _ResultsListBuilder()),
      ],
    ),
  );
}
