
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_animal_app/cubits/animal_cubit.dart';
import 'package:com.example.simple_animal_app/models/animal.dart';

class AnimalText extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final animal = context.watch<AnimalCubit>().state;

		return GestureDetector(
			onTap: () {
				context.read<AnimalCubit>().toggleAnimal();
			},
			child: Row(
				children: [
					Text(animal.text),
					Icon(animal.icon),
				],
			),
		);
	}
}
