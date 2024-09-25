
import 'package:flutter_test/flutter_test.dart';
import 'package:animalswitcher/models/animal.dart';

void main() {
	group('Animal Model Tests', () {
		test('Animal model should correctly initialize with name and icon', () {
			const animalName = 'Cat';
			const animalIcon = Icons.pets; // Assuming Icons.pets for Cat

			final animal = Animal(name: animalName, icon: animalIcon);

			expect(animal.name, animalName);
			expect(animal.icon, animalIcon);
		});

		test('Animal model should correctly serialize to JSON', () {
			const animalName = 'Cat';
			const animalIcon = Icons.pets; // Assuming Icons.pets for Cat

			final animal = Animal(name: animalName, icon: animalIcon);
			final json = animal.toJson();

			expect(json['name'], animalName);
			expect(json['icon'], animalIcon.codePoint);
		});

		test('Animal model should correctly deserialize from JSON', () {
			const animalName = 'Cat';
			const animalIconCodePoint = Icons.pets.codePoint; // Assuming Icons.pets for Cat

			final json = {'name': animalName, 'icon': animalIconCodePoint};
			final animal = Animal.fromJson(json);

			expect(animal.name, animalName);
			expect(animal.icon.codePoint, animalIconCodePoint);
		});
	});
}
