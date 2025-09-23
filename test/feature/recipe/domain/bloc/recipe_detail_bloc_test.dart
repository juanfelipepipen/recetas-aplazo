import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/feature/pages/recipe/domain/bloc/recipe_detail_bloc.dart';
import 'package:recetas_aplazo/src/feature/pages/recipe/domain/repository/recipe_repository.dart';

class MockRecipeRepository extends Mock implements RecipeRepository {}

void main() {
  group('RecipeDetailBloc', () {
    late MockRecipeRepository mockRepository;
    const recipeId = 99;
    final recipe = Recipe(
      id: recipeId,
      name: 'Bread and Butter Pudding',
      ingredients: const [],
      thumb: '',
      instructions: '',
    );

    setUp(() {
      mockRepository = MockRecipeRepository();
    });

    blocTest<RecipeDetailBloc, FetchState<Recipe>>(
      'emits Success with recipe on creation (CubitFetch auto-fetch)',
      build: () {
        when(() => mockRepository.getRecipe(id: recipeId)).thenAnswer((_) async => recipe);
        return RecipeDetailBloc(recipeId: recipeId, repository: mockRepository);
      },
      expect: () => [isA<FetchSuccess<Recipe>>().having((s) => s.result, 'result', recipe)],
      verify: (_) {
        verify(() => mockRepository.getRecipe(id: recipeId)).called(1);
      },
    );

    blocTest<RecipeDetailBloc, FetchState<Recipe>>(
      'like updates state when success and returns repository.like result',
      build: () {
        when(() => mockRepository.getRecipe(id: recipeId)).thenAnswer((_) async => recipe);
        when(() => mockRepository.like(recipeId)).thenReturn(true);
        return RecipeDetailBloc(recipeId: recipeId, repository: mockRepository);
      },
      act: (bloc) async {
        // Wait for the initial success emission before liking
        await bloc.stream.firstWhere((s) => s is FetchSuccess<Recipe>);
        final result = await bloc.like(false);
        expect(result, isTrue);
      },
      expect: () => [
        isA<FetchSuccess<Recipe>>().having((s) => s.result, 'result', recipe),
        isA<FetchSuccess<Recipe>>()
            .having((s) => s.result.id, 'id', recipeId)
            .having((s) => s.result.like, 'like', true),
      ],
      verify: (_) {
        verify(() => mockRepository.like(recipeId)).called(1);
      },
    );
  });
}
