
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:animalswitcher/widgets/animal_text.dart';
import 'package:animalswitcher/cubits/animal_cubit.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('AnimalText Widget Tests', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = MockAnimalCubit();
		});

		testWidgets('displays initial animal state (Cat)', (WidgetTester tester) async {
			when(() => animalCubit.state).thenReturn(AnimalState(animal: Animal(name: 'Cat', icon: Icons.pets)));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => animalCubit,
						child: AnimalText(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.pets), findsOneWidget);
		});

		testWidgets('toggles animal to Dog on tap', (WidgetTester tester) async {
			when(() => animalCubit.state).thenReturn(AnimalState(animal: Animal(name: 'Cat', icon: Icons.pets)));
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>(
						create: (_) => animalCubit,
						child: AnimalText(),
					),
				),
			);

			whenListen(
				animalCubit,
				Stream.fromIterable([AnimalState(animal: Animal(name: 'Dog', icon: Icons.person))]),
			);

			await tester.tap(find.text('Cat'));
			await tester.pumpAndSettle();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
