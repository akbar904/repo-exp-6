
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_animal_app/main.dart';

class MockAnimalCubit extends MockCubit<Animal> implements AnimalCubit {}

void main() {
	group('Main App Initialization', () {
		testWidgets('displays HomeScreen on app launch', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(HomeScreen), findsOneWidget);
		});
	});

	group('AnimalCubit', () {
		late MockAnimalCubit mockAnimalCubit;

		setUp(() {
			mockAnimalCubit = MockAnimalCubit();
		});

		blocTest<MockAnimalCubit, Animal>(
			'emits [Dog] when toggleAnimal is called',
			build: () => mockAnimalCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [Animal(text: 'Dog', icon: Icons.person)],
		);

		blocTest<MockAnimalCubit, Animal>(
			'emits [Cat] when toggleAnimal is called again',
			build: () => mockAnimalCubit,
			act: (cubit) {
				cubit.toggleAnimal();
				cubit.toggleAnimal();
			},
			expect: () => [
				Animal(text: 'Dog', icon: Icons.person),
				Animal(text: 'Cat', icon: Icons.access_time)
			],
		);
	});
}
