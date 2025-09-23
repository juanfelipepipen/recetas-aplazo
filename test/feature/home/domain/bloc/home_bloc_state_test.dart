import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pipen_bloc/pipen_bloc.dart';
import 'package:recetas_aplazo/src/data/entities/recipe.dart';
import 'package:recetas_aplazo/src/feature/pages/home/domain/bloc/recipes_cubit.dart';
import 'package:recetas_aplazo/src/feature/pages/home/domain/repository/home_repository.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  group('HomeBlocTests', () {
    late RecipesCubit cubit;
    late MockHomeRepository mockRepository;

    final fakeRecipes = [
      Recipe(id: 1, name: 'Apple Frangipan Tart', ingredients: [], thumb: '', instructions: ''),
      Recipe(id: 2, name: 'Apam balik', ingredients: [], thumb: '', instructions: ''),
      Recipe(id: 3, name: 'Ayam Percik', ingredients: [], thumb: '', instructions: ''),
      Recipe(
        id: 4,
        name: 'Apple & Blackberry Crumble',
        ingredients: [],
        thumb: '',
        instructions: '',
      ),
    ];

    setUp(() {
      mockRepository = MockHomeRepository();

      when(() => mockRepository.getRecipes(char: 'a')).thenAnswer((_) async => fakeRecipes);
      when(() => mockRepository.getRecipes(char: 'b')).thenAnswer((_) async => fakeRecipes);

      cubit = RecipesCubit(repository: mockRepository);
    });

    blocTest<RecipesCubit, FetchState<List<Recipe>>>(
      'Get recipes by ',
      build: () => cubit,
      act: (cubit) => cubit.fetch(),
      expect: () => [
        isA<FetchLoading<List<Recipe>>>(),
        isA<FetchSuccess<List<Recipe>>>().having((s) => s.result, 'result', fakeRecipes),
      ],
    );

    blocTest<RecipesCubit, FetchState<List<Recipe>>>(
      'Validate unexcepted recipe getter from erroneous char',
      build: () => cubit,
      act: (c) {
        when(
          () => mockRepository.getRecipes(char: any(named: 'char')),
        ).thenThrow(Exception('API error'));
        cubit.fetch();
      },
      expect: () => [isA<FetchLoading<List<Recipe>>>(), isA<FetchFail<List<Recipe>>>()],
    );
  });
}
