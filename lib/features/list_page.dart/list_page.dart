import 'package:animals/core/enums.dart';
import 'package:animals/data/animals_data_sources.dart';
import 'package:animals/features/list_page.dart/cubit/animals_cubit.dart';
import 'package:animals/features/list_page.dart/widgets/animal_card.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/presentation/radius.dart';
import 'package:animals/repository/animals_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Sorry, something went wrong ='("),
                backgroundColor: AppColors.errorColor,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.mainColor,
              actions: [
                IconButton(
                    padding: const EdgeInsets.fromLTRB(
                      AppDimens.s,
                      AppDimens.s,
                      AppDimens.ms,
                      AppDimens.s,
                    ),
                    iconSize: 35,
                    onPressed: () {
                      context.read<AnimalsCubit>().getAnimalsModel();
                      ;
                    },
                    icon: const Icon(Icons.refresh))
              ],
              title: const Text(
                'Read something about animals!',
                style: AppTypography.h2,
              ),
            ),
            body: Center(
              child: Builder(
                builder: (context) {
                  if (state.status == Status.loading) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Loading Knowledge!!',
                          style: AppTypography.h2,
                        ),
                        SizedBox(height: AppDimens.l),
                        CircularProgressIndicator(),
                      ],
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(AppDimens.s),
                    child: ListView(
                      children: [
                        for (final animals in state.animalsModel)

                          //  AnimalCard(animalModel)
                          Padding(
                            padding: const EdgeInsets.only(bottom: AppRadius.s),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return animalCard(animals, context);
                                  },
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.listElementBlack,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(AppRadius.ms)),
                                  border: Border.all(
                                    width: 3,
                                    color: AppColors.black,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(AppDimens.s),
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
                                          padding:
                                              const EdgeInsets.all(AppDimens.s),
                                          child: Column(
                                            children: [
                                              const Text('Name:',
                                                  style: AppTypography.h2),
                                              Text(animals.name.toString(),
                                                  style: AppTypography.h2),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
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
