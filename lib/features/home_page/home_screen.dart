import 'package:animals/core/enums.dart';
import 'package:animals/data/animal_data_sources.dart';
import 'package:animals/features/cubit/animals_cubit.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/repository/animal_repository.dart';
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
          AnimalCubit(AnimalRepository(AnimalRemoteDataSource()))
            ..getAnimalModel(),
      child: Scaffold(
        body: BlocConsumer<AnimalCubit, AnimalState>(
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
                        if (animalModel != null)
                          //  AnimalCard(animalModel)
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              border: Border.all(
                                width: 3,
                                color: Colors.black,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(Dimens.s),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.network(
                                    animalModel.imageLink.toString(),
                                    width: 150,
                                    height: 150,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Name:',
                                        style: AppTypography.h2,
                                      ),
                                      Text(
                                        animalModel.name.toString(),
                                        style: AppTypography.h2,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
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
