import 'package:animals/features/favorites_firebase/cubit/favoritesfirebase_cubit.dart';
import 'package:animals/features/favorites_firebase/cubit/favoritesfirebase_state.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/presentation/radius.dart';
import 'package:animals/repository/favorite_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesFirebase extends StatelessWidget {
  const FavoritesFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesFirebaseCubit(
        AnimalsFirebaseRepository(),
      )..start(),
      child: BlocBuilder<FavoritesFirebaseCubit, FavoritesFirebaseState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.errorMessage),
              ],
            );
          }
          if (state.isLoading == true) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
              ],
            );
          }

          final animalModel = state.favoriteAnimal;
          return ListView.builder(
              itemCount: animalModel.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: AppColors.transparent,
                          insetPadding: const EdgeInsets.all(AppDimens.m),
                          child: SingleChildScrollView(
                            child: Container(
                              width: 350,
                              height: 750,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppRadius.xm),
                                color: AppColors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(AppDimens.s),
                                child: Column(
                                  children: [
                                    Image.network(
                                      animalModel[index].imageLink.toString(),
                                      width: 200,
                                      height: 200,
                                    ),
                                    const SizedBox(height: (AppDimens.s)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Name:',
                                          style: AppTypography.h3,
                                        ),
                                        Text(
                                          animalModel[index].name.toString(),
                                          style: AppTypography.h3,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: (AppDimens.s)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Latin name:',
                                          style: AppTypography.body2bold,
                                        ),
                                        Text(
                                          animalModel[index]
                                              .latinName
                                              .toString(),
                                          style: AppTypography.body2bold,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: (AppDimens.s)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Animal type:',
                                          style: AppTypography.body2bold,
                                        ),
                                        Text(
                                          animalModel[index]
                                              .animalType
                                              .toString(),
                                          style: AppTypography.body2bold,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: (AppDimens.s)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Active time:',
                                          style: AppTypography.body2bold,
                                        ),
                                        Text(
                                          animalModel[index]
                                              .activeTime
                                              .toString(),
                                          style: AppTypography.body2bold,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: (AppDimens.s)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Lenght minimum:',
                                          style: AppTypography.body2bold,
                                        ),
                                        Text(
                                          animalModel[index]
                                              .lengthMin
                                              .toString(),
                                          style: AppTypography.body2bold,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: (AppDimens.s)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Lenght maximum:',
                                          style: AppTypography.body2bold,
                                        ),
                                        Text(
                                          animalModel[index]
                                              .lengthMax
                                              .toString(),
                                          style: AppTypography.body2bold,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: (AppDimens.s)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Weight minimum:',
                                          style: AppTypography.body2bold,
                                        ),
                                        Text(
                                          animalModel[index]
                                              .weightMin
                                              .toString(),
                                          style: AppTypography.body2bold,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: (AppDimens.s)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Weight maximum:',
                                          style: AppTypography.body2bold,
                                        ),
                                        Text(
                                          animalModel[index]
                                              .weightMax
                                              .toString(),
                                          style: AppTypography.body2bold,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: (AppDimens.s)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Life span:',
                                          style: AppTypography.body2bold,
                                        ),
                                        // Text(
                                        //   animalModel[index]
                                        //       .lifespan
                                        //       .toString(),
                                        //   style: AppTypography.body2bold,
                                        // ),
                                      ],
                                    ),
                                    const SizedBox(height: (AppDimens.s)),
                                    Column(
                                      children: [
                                        const Text(
                                          'Habitat:',
                                          style: AppTypography.body2bold,
                                        ),
                                        Text(
                                          animalModel[index].habitat.toString(),
                                          style: AppTypography.body2bold,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: (AppDimens.s)),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Diet:',
                                          style: AppTypography.body2bold,
                                        ),
                                        Text(
                                          animalModel[index].diet.toString(),
                                          style: AppTypography.body2bold,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: (AppDimens.s)),
                                    Column(
                                      children: [
                                        const Text(
                                          'Geography range:',
                                          style: AppTypography.body2bold,
                                        ),
                                        Text(
                                          animalModel[index]
                                              .geoRange
                                              .toString(),
                                          style: AppTypography.body2bold,
                                        ),
                                      ],
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: AppColors.mainColor,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text(
                                            'I read all, let me out :)'))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.listElementBlack,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(AppRadius.ms)),
                      border: Border.all(
                        width: 3,
                        color: AppColors.black,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimens.s),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            animalModel[index].imageLink.toString(),
                            width: 150,
                            height: 150,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                // const Text('Name:',
                                //     style: AppTypography.h2),
                                Text(animalModel[index].name.toString(),
                                    textAlign: TextAlign.center,
                                    style: AppTypography.h2),
                                IconButton(
                                    color: AppColors.errorColor,
                                    onPressed: () {
                                      context
                                          .read<FavoritesFirebaseCubit>()
                                          .delete(id: animalModel[index].id);
                                    },
                                    icon: const Icon(Icons.delete))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
