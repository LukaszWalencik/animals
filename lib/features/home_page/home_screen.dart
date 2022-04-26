import 'package:animals/core/enums.dart';
import 'package:animals/data/animal_data_sources.dart';
import 'package:animals/features/cubit/animals_cubit.dart';
import 'package:animals/features/home_page/widget/animal_card.dart';
import 'package:animals/repository/animals_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AnimalsCubit(AnimalRepository(AnimalRemoteDataSource()))
            ..getAnimalModel(),
      child: Scaffold(
        body: BlocConsumer<AnimalsCubit, AnimalsState>(
          listener: (context, state) {
            if (state.status == Status.error) {
              final errorMessage = state.errorMessage ?? 'Unkown error';
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(errorMessage),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            final animalModel = state.animalModel;
            return Center(
              child: Builder(
                builder: (context) {
                  if (state.status == Status.loading) {
                    return const Text('Loading');
                  }
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView(
                      children: [
                        if (animalModel != null) AnimalCard(animalModel)
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
