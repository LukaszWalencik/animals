import 'package:animals/core/enums.dart';
import 'package:animals/data/animal_data_sources.dart';
import 'package:animals/features/cubit/animals_cubit.dart';
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
        }, builder: (context, state) {
          final animalModel = state.animalModel;
          return Center(
            child: Builder(
              builder: (context) {
                if (state.status == Status.loading) {
                  return const Text('Loading');
                }
                return Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          if (animalModel != null)
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    animalModel.name.toString(),
                                  ),
                                  Text(
                                    animalModel.imageLink.toString(),
                                  ),
                                  Text(
                                    animalModel.name.toString(),
                                  ),
                                  Text(
                                    animalModel.animalType.toString(),
                                  ),
                                  Text(
                                    animalModel.latinName.toString(),
                                  ),
                                  Text(
                                    animalModel.imageLink.toString(),
                                  ),
                                  Text(
                                    animalModel.activeTime.toString(),
                                  ),
                                  Text(
                                    animalModel.lengthMin.toString(),
                                  ),
                                  Text(
                                    animalModel.lengthMax.toString(),
                                  ),
                                  Text(
                                    animalModel.weightMin.toString(),
                                  ),
                                  Text(
                                    animalModel.weightMax.toString(),
                                  ),
                                  Text(
                                    animalModel.lifespan.toString(),
                                  ),
                                  Text(
                                    animalModel.habitat.toString(),
                                  ),
                                  Text(
                                    animalModel.diet.toString(),
                                  ),
                                  Text(
                                    animalModel.geoRange.toString(),
                                  ),
                                  Text(
                                    animalModel.imageLink.toString(),
                                  ),
                                  Text(
                                    animalModel.id.toString(),
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        })));
  }
}
