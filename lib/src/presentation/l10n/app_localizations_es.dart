// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get homeTitle => 'Recetas APLAZO';

  @override
  String get homeGreetings => '¿Qué vamos a\ncocinar hoy?';

  @override
  String get homeRecipes => 'Recetas';

  @override
  String get homeLoadMoreButtonTitle => 'Ver mas recetas';

  @override
  String get recipeIngredients => 'Ingredientes';

  @override
  String get recipeInstructions => 'Instrucciones';
}
