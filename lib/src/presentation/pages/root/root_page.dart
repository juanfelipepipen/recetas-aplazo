import 'package:recetas_aplazo/src/presentation/pages/root/root_builder_page.dart';
import 'package:recetas_aplazo/src/presentation/router/routes/recipe_route.dart';
import 'package:recetas_aplazo/src/presentation/router/routes/search_route.dart';
import 'package:recetas_aplazo/src/presentation/router/routes/home_route.dart';
import 'package:recetas_aplazo/src/presentation/l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_formux/flutter_formux.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part '../../router/app_router.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'ucombi',
    theme: Theme.of(context).copyWith(
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
