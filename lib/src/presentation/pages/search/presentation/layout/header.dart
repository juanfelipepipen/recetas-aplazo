part of '../search_page.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) => SafeArea(
    child: SizedBox(
      height: context.height * 0.1,
      child: Center(
        child: PipenColumn.center(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          children: [
            Text(
              context.localizations.searchTitle,
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
                letterSpacing: 0.7,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
