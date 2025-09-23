import 'package:recetas_aplazo/src/shared/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:recetas_aplazo/src/shared/router/app_router.dart';
import 'package:flutter_formux/flutter_formux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RootPage extends StatelessWidget {
  RootPage({super.key});

  final _router = router;

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'ucombi',
    theme: Theme.of(context).copyWith(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Color.fromRGBO(0, 238, 252, 1),
      textSelectionTheme: TextSelectionThemeData(cursorColor: Color.fromRGBO(0, 238, 252, 1)),
      inputDecorationTheme: InputDecorationTheme(
        floatingLabelStyle: TextStyle(),
        errorStyle: TextStyle(fontSize: 14, color: Colors.red),
        hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.black.withValues(alpha: 0.7),
        ),
        outlineBorder: BorderSide(color: Color.fromRGBO(0, 238, 252, 1)),
        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Color.fromRGBO(0, 238, 252, 1)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(width: 2, color: Color.fromRGBO(0, 238, 252, 0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(width: 2, color: Color.fromRGBO(0, 238, 252, 1)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
      ),
    ),
    debugShowCheckedModeBanner: false,
    routerDelegate: _router.routerDelegate,
    routeInformationParser: _router.routeInformationParser,
    routeInformationProvider: _router.routeInformationProvider,
    localizationsDelegates: [
      AppLocalizations.delegate,
      FormuxLocalization.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [Locale('es', 'MX'), Locale('es')],
  );
}
