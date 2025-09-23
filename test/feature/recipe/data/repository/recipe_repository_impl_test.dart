import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/data/entities/recipe_like.dart';
import 'package:recetas_aplazo/src/feature/pages/recipe/data/repository/recipe_repository_impl.dart';
import 'package:recetas_aplazo/src/feature/pages/recipe/data/services/recipe_api_service.dart';
import 'package:recetas_aplazo/src/feature/pages/recipe/domain/repository/recipe_repository.dart';
import 'package:recetas_aplazo/src/shared/storage/recipe_like_service.dart';

class MockRecipeApiService extends Mock implements RecipeApiService {}

class MockRecipeLikeService extends Mock implements RecipeLikeService {}

void main() {
  late MockRecipeApiService mockApi;
  late MockRecipeLikeService mockLikeService;
  late RecipeRepository repository;

  setUp(() {
    mockApi = MockRecipeApiService();
    mockLikeService = MockRecipeLikeService();
    repository = RecipeRepositoryImpl(service: mockApi, likeService: mockLikeService);
  });

  group('RecipeRepositoryImpl', () {
    test('getRecipe returns recipe with like true when like exists', () async {
      // Arrange
      const id = 10;
      final apiRecipe = Recipe(
        id: id,
        name: 'Beef Stew',
        ingredients: const [],
        thumb: '',
        instructions: '',
      );

      when(() => mockApi.request(recipeId: id)).thenAnswer((_) async => apiRecipe);
      when(() => mockLikeService.getRecipeLike(id)).thenReturn(RecipeLike(recipeId: id));

      // Act
      final result = await repository.getRecipe(id: id);

      // Assert
      verify(() => mockApi.request(recipeId: id)).called(1);
      verify(() => mockLikeService.getRecipeLike(id)).called(1);
      expect(result.like, isTrue);
      expect(result.id, id);
    });

    test('getRecipe returns recipe with like false when like not exists', () async {
      // Arrange
      const id = 11;
      final apiRecipe = Recipe(
        id: id,
        name: 'Apple Pie',
        ingredients: const [],
        thumb: '',
        instructions: '',
      );

      when(() => mockApi.request(recipeId: id)).thenAnswer((_) async => apiRecipe);
      when(() => mockLikeService.getRecipeLike(id)).thenReturn(null);

      // Act
      final result = await repository.getRecipe(id: id);

      // Assert
      expect(result.like, isFalse);
      expect(result.id, id);
    });

    test('like proxies to like service', () async {
      // Arrange
      const id = 12;
      when(() => mockLikeService.like(id)).thenReturn(true);

      // Act
      final liked = repository.like(id);

      // Assert
      verify(() => mockLikeService.like(id)).called(1);
      expect(liked, isTrue);
    });
  });
}
