import 'package:flutter/material.dart';
import 'package:recetas_aplazo/src/core/app_object_box.dart';
import 'package:recetas_aplazo/src/presentation/pages/root/root_page.dart';
import 'package:recetas_aplazo/src/shared/di.dart';

Future<void> main() async {
  initLocator();
  await AppObjectBox.boot();
  runApp(const RootPage());
}
