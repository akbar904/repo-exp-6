
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_animal_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_animal_app/cubits/animal_cubit.dart';
import 'package:simple_animal_app/models/animal.dart';

// Mock dependencies
class MockAnimalCubit extends MockCubit<Animal> implements AnimalCubit {}

void main() {
	group('HomeScreen Widget Tests', () {
		late AnimalCubit animalCubit;

		setUp(() {
			animalCubit = MockAnimalCubit();
		});

		testWidgets('displays Cat text and icon initially', (WidgetTester tester) async {
			when(() => animalCubit.state).thenReturn(Animal(text: 'Cat', icon: Icons.pets));

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>.value(
						value: animalCubit,
						child: HomeScreen(),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.pets), findsOneWidget);
		});

		testWidgets('displays Dog text and icon after tap', (WidgetTester tester) async {
			whenListen(
				animalCubit,
				Stream.fromIterable([
					Animal(text: 'Cat', icon: Icons.pets),
					Animal(text: 'Dog', icon: Icons.person),
				]),
				initialState: Animal(text: 'Cat', icon: Icons.pets),
			);

			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AnimalCubit>.value(
						value: animalCubit,
						child: HomeScreen(),
					),
				),
			);

			await tester.tap(find.text('Cat'));
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});
	});
}
