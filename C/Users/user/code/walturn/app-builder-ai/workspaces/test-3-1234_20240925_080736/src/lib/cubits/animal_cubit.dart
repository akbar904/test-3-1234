
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:animalswitcher/models/animal.dart';

class AnimalState {
	final String name;
	final IconData icon;

	const AnimalState({required this.name, required this.icon});
}

class AnimalCubit extends Cubit<AnimalState> {
	AnimalCubit() : super(AnimalState(name: 'Cat', icon: Icons.pets));

	void toggleAnimal() {
		if (state.name == 'Cat') {
			emit(AnimalState(name: 'Dog', icon: Icons.person));
		} else {
			emit(AnimalState(name: 'Cat', icon: Icons.pets));
		}
	}
}
