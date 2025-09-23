import 'package:recetas_aplazo/src/feature/pages/root/root_page.dart';
import 'package:recetas_aplazo/src/shared/dio/dio_service.dart';
import 'package:recetas_aplazo/src/core/app_object_box.dart';
import 'package:recetas_aplazo/src/shared/di/di.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initLocator();
  await DioService.boot();
  await AppObjectBox.boot();
  runApp(RootPage());
}
