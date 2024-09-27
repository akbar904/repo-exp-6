
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_animal_app/cubits/animal_cubit.dart';

class MockAnimalCubit extends MockCubit<Animal> implements AnimalCubit {}

void main() {
	group('AnimalCubit Tests', () {
		late AnimalCubit animalCubit;
		
		setUp(() {
			animalCubit = AnimalCubit();
		});
		
		tearDown(() {
			animalCubit.close();
		});
		
		test('initial state is Animal(text: "Cat", icon: Icons.pets)', () {
			expect(animalCubit.state, Animal(text: 'Cat', icon: Icons.pets));
		});
		
		blocTest<AnimalCubit, Animal>(
			'emit Animal(text: "Dog", icon: Icons.person) when toggleAnimal is called',
			build: () => animalCubit,
			act: (cubit) => cubit.toggleAnimal(),
			expect: () => [Animal(text: 'Dog', icon: Icons.person)],
		);
		
		blocTest<AnimalCubit, Animal>(
			'toggleAnimal toggles state between Cat and Dog',
			build: () => animalCubit,
			act: (cubit) {
				cubit.toggleAnimal();
				cubit.toggleAnimal();
			},
			expect: () => [
				Animal(text: 'Dog', icon: Icons.person),
				Animal(text: 'Cat', icon: Icons.pets),
			],
		);
	});
}
