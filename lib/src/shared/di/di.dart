import 'package:recetas_aplazo/src/presentation/pages/home/data/repository/home_repository_impl.dart';
import 'package:recetas_aplazo/src/presentation/pages/home/domain/repository/home_repository.dart';
import 'package:recetas_aplazo/src/presentation/pages/home/data/services/home_api_service.dart';
import 'package:recetas_aplazo/src/presentation/pages/home/domain/bloc/recipes_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:recetas_aplazo/src/presentation/pages/recipe/data/repository/recipe_repository_impl.dart';
import 'package:recetas_aplazo/src/presentation/pages/recipe/data/services/recipe_api_service.dart';
import 'package:recetas_aplazo/src/presentation/pages/recipe/domain/repository/recipe_repository.dart';
import 'package:recetas_aplazo/src/presentation/pages/search/data/repository/search_recipe_repository_impl.dart';
import 'package:recetas_aplazo/src/presentation/pages/search/data/services/search_recipe_api_service.dart';
import 'package:recetas_aplazo/src/presentation/pages/search/domain/bloc/recipe_search_cubit.dart';
import 'package:recetas_aplazo/src/presentation/pages/search/domain/repository/search_recipe_repository.dart';
import 'package:recetas_aplazo/src/shared/storage/recipe_like_service.dart';

final GetIt locator = GetIt.instance;

void initLocator() {
  locator.registerLazySingleton<RecipeLikeService>(() => RecipeLikeService());

  /// Home
  locator.registerLazySingleton<HomeApiService>(() => HomeApiService());
  locator.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(
      service: locator<HomeApiService>(),
      likeService: locator<RecipeLikeService>(),
    ),
  );
  locator.registerFactory<RecipesCubit>(() => RecipesCubit(repository: locator<HomeRepository>()));

  /// Recipes
  locator.registerLazySingleton<RecipeApiService>(() => RecipeApiService());
  locator.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(
      service: locator<RecipeApiService>(),
      likeService: locator<RecipeLikeService>(),
    ),
  );

  /// Search
  locator.registerLazySingleton<SearchRecipeApiService>(() => SearchRecipeApiService());
  locator.registerLazySingleton<SearchRecipeRepository>(
    () => SearchRecipeRepositoryImpl(service: locator<SearchRecipeApiService>()),
  );
  locator.registerFactory<RecipeSearchCubit>(
    () => RecipeSearchCubit(repository: locator<SearchRecipeRepository>()),
  );
}
