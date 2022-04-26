import 'package:animals/core/enums.dart';
import 'package:animals/data/animals_data_sources.dart';
import 'package:animals/features/list_page.dart/cubit/animals_cubit.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/repository/animals_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeListPage extends StatelessWidget {
  const HomeListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimalsCubit(
        AnimalsRepository(
          AnimalsRemoteDataSource(
            Dio(),
          ),
        ),
      )..getAnimalsModel(),
      child: BlocConsumer<AnimalsCubit, AnimalsState>(
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
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.purple,
              actions: [
                IconButton(
                    padding: EdgeInsets.fromLTRB(8, 8, 20, 8),
                    iconSize: 35,
                    onPressed: () {
                      context.read<AnimalsCubit>().getAnimalsModel();
                    },
                    icon: Icon(Icons.refresh))
              ],
              title: Text(
                'Read something about animals!',
                style: AppTypography.h2,
              ),
            ),
            body: Center(
              child: Builder(
                builder: (context) {
                  if (state.status == Status.loading) {
                    return const Text('Loading');
                  }
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView(
                      children: [
                        for (final animals in state.animalsModel)
                          //  AnimalCard(animalModel)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
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
                                      animals.imageLink.toString(),
                                      width: 150,
                                      height: 150,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              'Name:',
                                              style: AppTypography.h2,
                                            ),
                                            Text(
                                              animals.name.toString(),
                                              style: AppTypography.h2,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
