
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animalswitcher/cubits/animal_cubit.dart';
import 'package:animalswitcher/models/animal.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('AnimalCubit', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = AnimalCubit();
		});

		tearDown(() {
			animalCubit.close();
		});

		test('initial state is AnimalState with name Cat and Icons.pets', () {
			expect(animalCubit.state.name, 'Cat');
			expect(animalCubit.state.icon, Icons.pets);
		});

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalState(name: Dog, icon: Icons.person)] when toggleAnimal is called',
			build: () => animalCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [
				AnimalState(name: 'Dog', icon: Icons.person)
			],
		);

		blocTest<AnimalCubit, AnimalState>(
			'emits [AnimalState(name: Cat, icon: Icons.pets)] when toggleAnimal is called twice',
			build: () => animalCubit,
			act: (cubit) {
				cubit.toggleAnimal();
				cubit.toggleAnimal();
			},
			expect: () => [
				AnimalState(name: 'Dog', icon: Icons.person),
				AnimalState(name: 'Cat', icon: Icons.pets)
			],
		);
	});
}
