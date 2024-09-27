
// test/models/animal_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:example/models/animal.dart';

void main() {
	group('Animal Model Tests', () {
		test('Animal model should correctly instantiate with provided text and icon', () {
			const text = 'Cat';
			const icon = Icons.pets;

			final animal = Animal(text: text, icon: icon);

			expect(animal.text, text);
			expect(animal.icon, icon);
		});

		test('Animal model should support equality based on text and icon', () {
			const text = 'Dog';
			const icon = Icons.person;

			final animal1 = Animal(text: text, icon: icon);
			final animal2 = Animal(text: text, icon: icon);

			expect(animal1, equals(animal2));
		});

		test('Animal model should support serialization and deserialization', () {
			const text = 'Cat';
			const icon = Icons.pets;

			final animal = Animal(text: text, icon: icon);
			final json = animal.toJson();
			final deserializedAnimal = Animal.fromJson(json);

			expect(deserializedAnimal.text, text);
			expect(deserializedAnimal.icon, icon);
		});
	});
}
