
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:com.example.simple_animal_app/widgets/animal_text.dart';
import 'package:com.example.simple_animal_app/cubits/animal_cubit.dart';
import 'package:com.example.simple_animal_app/models/animal.dart';

class MockAnimalCubit extends MockCubit<Animal> implements AnimalCubit {}

void main() {
	group('AnimalText Widget', () {
		late MockAnimalCubit mockAnimalCubit;

		setUp(() {
			mockAnimalCubit = MockAnimalCubit();
		});

		testWidgets('displays Cat text and clock icon initially', (WidgetTester tester) async {
			when(() => mockAnimalCubit.state).thenReturn(Animal(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				BlocProvider<AnimalCubit>.value(
					value: mockAnimalCubit,
					child: MaterialApp(
						home: Scaffold(
							body: AnimalText(),
						),
					),
				),
			);

			expect(find.text('Cat'), findsOneWidget);
			expect(find.byIcon(Icons.access_time), findsOneWidget);
		});

		testWidgets('displays Dog text and person icon after toggle', (WidgetTester tester) async {
			when(() => mockAnimalCubit.state).thenReturn(Animal(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				BlocProvider<AnimalCubit>.value(
					value: mockAnimalCubit,
					child: MaterialApp(
						home: Scaffold(
							body: AnimalText(),
						),
					),
				),
			);

			when(() => mockAnimalCubit.state).thenReturn(Animal(text: 'Dog', icon: Icons.person));
			mockAnimalCubit.toggleAnimal();
			await tester.pump();

			expect(find.text('Dog'), findsOneWidget);
			expect(find.byIcon(Icons.person), findsOneWidget);
		});

		testWidgets('taps on AnimalText triggers toggleAnimal method', (WidgetTester tester) async {
			when(() => mockAnimalCubit.state).thenReturn(Animal(text: 'Cat', icon: Icons.access_time));

			await tester.pumpWidget(
				BlocProvider<AnimalCubit>.value(
					value: mockAnimalCubit,
					child: MaterialApp(
						home: Scaffold(
							body: AnimalText(),
						),
					),
				),
			);

			await tester.tap(find.byType(AnimalText));
			verify(() => mockAnimalCubit.toggleAnimal()).called(1);
		});
	});
}
