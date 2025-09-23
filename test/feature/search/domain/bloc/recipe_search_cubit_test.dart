import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/feature/pages/search/domain/bloc/recipe_search_cubit.dart';
import 'package:recetas_aplazo/src/feature/pages/search/domain/repository/search_recipe_repository.dart';

class MockSearchRecipeRepository extends Mock implements SearchRecipeRepository {}

void main() {
  group('RecipeSearchCubit', () {
    late MockSearchRecipeRepository mockRepository;
    late RecipeSearchCubit cubit;

    final fakeRecipes = <Recipe>[
      const Recipe(id: 1, name: 'Chicken Handi', ingredients: [], thumb: '', instructions: ''),
      const Recipe(id: 2, name: 'Chicken Kiev', ingredients: [], thumb: '', instructions: ''),
    ];

    setUp(() {
      mockRepository = MockSearchRecipeRepository();
      cubit = RecipeSearchCubit(repository: mockRepository);
    });

    tearDown(() async {
      await cubit.close();
    });

    test('Initial state is FetchPending', () {
      expect(cubit.state, isA<FetchPending<RecipeList>>());
    });

    blocTest<RecipeSearchCubit, FetchState<RecipeList>>(
      'search with empty value emits FetchPending only',
      build: () => cubit,
      act: (bloc) => bloc.search(''),
      expect: () => [isA<FetchPending<RecipeList>>()],
    );

    blocTest<RecipeSearchCubit, FetchState<RecipeList>>(
      'Search with value debounces and emits Loading then Success state',
      build: () {
        when(
          () => mockRepository.searchFromUserInput(input: 'chicken'),
        ).thenAnswer((_) async => fakeRecipes);
        return RecipeSearchCubit(repository: mockRepository);
      },
      act: (bloc) async {
        bloc.search('chicken');
        await Future<void>.delayed(const Duration(milliseconds: 1100));
      },
      wait: const Duration(milliseconds: 1200),
      expect: () => [
        isA<FetchLoading<RecipeList>>(),
        isA<FetchSuccess<RecipeList>>().having((s) => s.result, 'result', fakeRecipes),
      ],
      verify: (_) {
        verify(() => mockRepository.searchFromUserInput(input: 'chicken')).called(1);
      },
    );

    blocTest<RecipeSearchCubit, FetchState<RecipeList>>(
      'Like updates specific recipe when in success state and returns value',
      build: () {
        when(
          () => mockRepository.searchFromUserInput(input: 'chicken'),
        ).thenAnswer((_) async => fakeRecipes);
        when(() => mockRepository.like(1)).thenReturn(true);
        return RecipeSearchCubit(repository: mockRepository);
      },
      act: (bloc) async {
        bloc.search('chicken');
        await Future<void>.delayed(const Duration(milliseconds: 1100));
        final res = await bloc.like(1, false);
        expect(res, isTrue);
      },
      wait: const Duration(milliseconds: 1200),
      expect: () => [
        isA<FetchLoading<RecipeList>>(),
        isA<FetchSuccess<RecipeList>>().having((s) => s.result, 'result', fakeRecipes),
        isA<FetchSuccess<RecipeList>>().having((s) => s.result.first.like, 'first.like', true),
      ],
      verify: (_) {
        verify(() => mockRepository.like(1)).called(1);
      },
    );

    blocTest<RecipeSearchCubit, FetchState<RecipeList>>(
      'Like returns null when not in success state',
      build: () => cubit,
      act: (bloc) async {
        final res = await bloc.like(1, false);
        expect(res, isNull);
      },
      expect: () => [],
    );

    blocTest<RecipeSearchCubit, FetchState<RecipeList>>(
      'Update replaces an item when exists in success list',
      build: () {
        when(
          () => mockRepository.searchFromUserInput(input: 'chicken'),
        ).thenAnswer((_) async => fakeRecipes);
        return RecipeSearchCubit(repository: mockRepository);
      },
      act: (bloc) async {
        bloc.search('chicken');
        await Future<void>.delayed(const Duration(milliseconds: 1100));
        bloc.update(
          const Recipe(
            id: 2,
            name: 'Chicken',
            like: true,
            ingredients: [],
            thumb: '',
            instructions: '',
          ),
        );
      },
      wait: const Duration(milliseconds: 1200),
      expect: () => [
        isA<FetchLoading<RecipeList>>(),
        isA<FetchSuccess<RecipeList>>().having((s) => s.result, 'result', fakeRecipes),
        isA<FetchSuccess<RecipeList>>().having((s) => s.result[1].like, 'second.like', true),
      ],
    );

    blocTest<RecipeSearchCubit, FetchState<RecipeList>>(
      'Closing cancels pending debounce',
      build: () => RecipeSearchCubit(repository: mockRepository),
      act: (bloc) async {
        when(
          () => mockRepository.searchFromUserInput(input: 'chicken'),
        ).thenAnswer((_) async => fakeRecipes);
        bloc.search('chicken');
        await bloc.close();
        await Future<void>.delayed(const Duration(milliseconds: 1200));
      },
      wait: const Duration(milliseconds: 1300),
      expect: () => [],
    );
  });
}
