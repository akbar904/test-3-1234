
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animalswitcher/cubits/animal_cubit.dart';
import 'package:animalswitcher/models/animal.dart';

class AnimalText extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return BlocBuilder<AnimalCubit, AnimalState>(
			builder: (context, state) {
				return GestureDetector(
					onTap: () => context.read<AnimalCubit>().toggleAnimal(),
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Text(state.animal.name),
							SizedBox(width: 8),
							Icon(state.animal.icon),
						],
					),
				);
			},
		);
	}
}
