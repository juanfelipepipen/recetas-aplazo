import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/feature/pages/search/data/repository/search_recipe_repository_impl.dart';
import 'package:recetas_aplazo/src/feature/pages/search/data/services/search_recipe_api_service.dart';
import 'package:recetas_aplazo/src/feature/pages/search/domain/repository/search_recipe_repository.dart';
import 'package:recetas_aplazo/src/shared/storage/recipe_like_service.dart';

class MockSearchRecipeApiService extends Mock implements SearchRecipeApiService {}

class MockRecipeLikeService extends Mock implements RecipeLikeService {}

void main() {
  late MockSearchRecipeApiService mockApi;
  late MockRecipeLikeService mockLikeService;
  late SearchRecipeRepository repository;

  setUp(() {
    mockApi = MockSearchRecipeApiService();
    mockLikeService = MockRecipeLikeService();
    repository = SearchRecipeRepositoryImpl(service: mockApi, likeService: mockLikeService);
  });

  group('SearchRecipeRepositoryImpl', () {
    test('searchFromUserInput returns list with likes set from likeService', () async {
      // Arrange
      const input = 'beef';
      final apiRecipes = <Recipe>[
        const Recipe(id: 1, name: 'Beef Stew', ingredients: [], thumb: '', instructions: ''),
        const Recipe(id: 2, name: 'Beef Pie', ingredients: [], thumb: '', instructions: ''),
      ];

      when(() => mockApi.request(input: input)).thenAnswer((_) async => apiRecipes);
      when(() => mockLikeService.setLikesFromList(apiRecipes)).thenReturn(apiRecipes);

      // Act
      final result = await repository.searchFromUserInput(input: input);

      // Assert
      verify(() => mockApi.request(input: input)).called(1);
      verify(() => mockLikeService.setLikesFromList(apiRecipes)).called(1);
      expect(result, apiRecipes);
    });

    test('Like proxies to like service', () async {
      // Arrange
      const id = 10;
      when(() => mockLikeService.like(id)).thenReturn(true);

      // Act
      final liked = repository.like(id);

      // Assert
      verify(() => mockLikeService.like(id)).called(1);
      expect(liked, isTrue);
    });
  });
}
