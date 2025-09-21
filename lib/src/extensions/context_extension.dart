import 'package:flutter/material.dart';
import 'package:recetas_aplazo/src/presentation/l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}
