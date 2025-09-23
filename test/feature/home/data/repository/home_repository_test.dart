import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/feature/pages/home/data/repository/home_repository_impl.dart';
import 'package:recetas_aplazo/src/feature/pages/home/data/services/home_api_service.dart';
import 'package:recetas_aplazo/src/feature/pages/home/domain/repository/home_repository.dart';
import 'package:recetas_aplazo/src/shared/storage/recipe_like_service.dart';

class MockHomeApiService extends Mock implements HomeApiService {}

class MockRecipeLikeService extends Mock implements RecipeLikeService {}

void main() {
  late MockRecipeLikeService mockLikeService;
  late MockHomeApiService mockService;
  late HomeRepository repository;

  setUp(() {
    mockService = MockHomeApiService();
    mockLikeService = MockRecipeLikeService();
    repository = HomeRepositoryImpl(service: mockService, likeService: mockLikeService);
  });

  test('getRecipes devuelve solo recetas que empiezan con la letra pasada', () async {
    // Arrange
    final char = 'b';
    final apiRecipes = <Recipe>[
      Recipe(
        id: 1,
        name: 'Bakewell',
        ingredients: [],
        thumb: 'https://imagefaker.access.mx.com/440x230/282828/eae0d0/',
        instructions:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been t',
      ),
      Recipe(
        id: 2,
        name: 'Bread and butter',
        ingredients: [],
        thumb: 'https://imagefaker.access.mx.com/440x230/282828/eae0d0/',
        instructions:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been t',
      ),
      Recipe(
        id: 3,
        name: 'Beef Wellington',
        ingredients: [],
        thumb: 'https://imagefaker.access.mx.com/440x230/282828/eae0d0/',
        instructions:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been t',
      ),
    ];

    when(() => mockService.request(char: char)).thenAnswer((_) async => apiRecipes);

    when(() => mockLikeService.setLikesFromList(apiRecipes)).thenReturn(apiRecipes);

    // Act
    final result = await repository.getRecipes(char: char);

    // Assert:
    verify(() => mockService.request(char: char)).called(1);
    verify(() => mockLikeService.setLikesFromList(apiRecipes)).called(1);

    expect(result.every((r) => r.name.toLowerCase().startsWith(char)), true);
  });
}
