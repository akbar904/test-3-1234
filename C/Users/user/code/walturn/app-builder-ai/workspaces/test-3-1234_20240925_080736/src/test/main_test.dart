
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/material.dart';
import 'package:animalswitcher/main.dart';
import 'package:animalswitcher/cubits/animal_cubit.dart';

class MockAnimalCubit extends MockCubit<AnimalState> implements AnimalCubit {}

void main() {
	group('MainApp', () {
		testWidgets('shows initial state with Cat text and clock icon', (WidgetTester tester) async {
			// Build our app and trigger a frame.
			await tester.pumpWidget(MyApp());

			// Verify that Cat text and clock icon are present.
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('toggles to Dog text and person icon when clicked', (WidgetTester tester) async {
			// Build our app and trigger a frame.
			await tester.pumpWidget(MyApp());

			// Verify that Cat text and clock icon are present.
			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);

			// Tap the text and trigger a frame.
			await tester.tap(find.text('Cat'));
			await tester.pump();

			// Verify that Dog text and person icon are present.
			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
