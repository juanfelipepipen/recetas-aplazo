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
  String get homeLoadError => 'Ocurrió un error al cargar las recetas';

  @override
  String get recipeIngredients => 'Ingredientes';

  @override
  String get recipeInstructions => 'Instrucciones';

  @override
  String get recipeLoadError =>
      'No pudimos cargar la receta, por favor, vuelta a intentar';

  @override
  String get searchTitle => '¿Qué te gustaría cocinar?';

  @override
  String get searchEmptyTitle => '¡Busca tus recetas preferidas!';

  @override
  String get searchInputLabel => 'Buscar receta';

  @override
  String get searchNotFound => 'No se encontraron recetas';

  @override
  String get searchLoadError => 'Ocurró un problema al realizar la búsqueda';

  @override
  String get componentRecipeCardErrorImage => 'Ocurrió un error';

  @override
  String get componentBlocFetchFailedBuilderTitle =>
      'Lo sentimos, ocurrió un error';

  @override
  String get componentBlocFetchFailedBuilderRetry => 'Volver a intentar';
}
