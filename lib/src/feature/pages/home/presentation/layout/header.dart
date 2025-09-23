part of '../home_page.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) => Center(
    child: SafeArea(
      child: SizedBox(
        height: context.height * 0.2,
        child: Center(
          child: Text(
            context.localizations.homeGreetings,
            style: context.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
              letterSpacing: 0.7,
            ),
          ),
        ),
      ),
    ),
  );
}
