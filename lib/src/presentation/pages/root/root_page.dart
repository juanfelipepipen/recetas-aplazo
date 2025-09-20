import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:recetas_aplazo/src/presentation/l10n/app_localizations.dart';
import 'package:recetas_aplazo/src/presentation/pages/root/root_builder_page.dart';
import 'package:recetas_aplazo/src/presentation/router/routes/home_route.dart';

part '../../router/app_router.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'ucombi',
    theme: Theme.of(context).copyWith(primaryColor: Color.fromRGBO(0, 238, 252, 1)),
    debugShowCheckedModeBanner: false,
    routerDelegate: _router.routerDelegate,
    routeInformationParser: _router.routeInformationParser,
    routeInformationProvider: _router.routeInformationProvider,
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [Locale('es', 'MX'), Locale('es')],
  );
}
