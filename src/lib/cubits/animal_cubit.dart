
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../models/animal.dart';

class AnimalCubit extends Cubit<Animal> {
	AnimalCubit() : super(Animal(text: 'Cat', icon: Icons.pets));

	void toggleAnimal() {
		if (state.text == 'Cat') {
			emit(Animal(text: 'Dog', icon: Icons.person));
		} else {
			emit(Animal(text: 'Cat', icon: Icons.pets));
		}
	}
}
