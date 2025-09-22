part of '../pages/root/root_page.dart';

final GoRouter _router = GoRouter(
  debugLogDiagnostics: false,
  // errorBuilder: (context, state) => const AppError(),
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) => RootBuilderPage(child: child),
      routes: [HomeRoute.route, RecipeRoute.route, SearchRoute.route],
    ),
  ],
);
