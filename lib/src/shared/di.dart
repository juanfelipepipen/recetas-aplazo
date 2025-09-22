import 'package:get_it/get_it.dart';
import 'package:recetas_aplazo/src/presentation/pages/home/data/repository/home_repository_impl.dart';
import 'package:recetas_aplazo/src/presentation/pages/home/data/services/home_api_service.dart';
import 'package:recetas_aplazo/src/presentation/pages/home/domain/bloc/recipes_cubit.dart';
import 'package:recetas_aplazo/src/presentation/pages/home/domain/repository/home_repository.dart';

final GetIt locator = GetIt.instance;

void initLocator() {
  locator.registerLazySingleton<HomeApiService>(() => HomeApiService());
  locator.registerLazySingleton(() => HomeRepositoryImpl(service: locator<HomeApiService>()));
  locator.registerFactory(() => RecipesCubit(repository: locator<HomeRepository>()));
}
