import 'package:animals/data/animals_data_sources.dart';
import 'package:animals/features/list_page/widgets/animal_card.dart';
import 'package:animals/features/list_page/cubit/animals_cubit.dart';
import 'package:animals/features/list_page/widgets/animals_loading_screen.dart';
import 'package:animals/features/list_page/widgets/animals_search_screen.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/presentation/radius.dart';
import 'package:animals/repository/animals_repository.dart';
import 'package:animals/repository/favorite_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:favorite_button/favorite_button.dart';

class HomeListPage extends StatelessWidget {
  HomeListPage({
    Key? key,
  }) : super(key: key);
  final animalcontroller = TextEditingController();

  final animalBox = Hive.box('animalsbox');
  // final animal = animalBox.get(index) as AnimalModel;
  var favorite = false;
  var star = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AnimalsCubit(
            AnimalsRepository(AnimalsRemoteDataSource(Dio())),
            AnimalsFirebaseRepository()),
        child: BlocConsumer<AnimalsCubit, AnimalsState>(
          listener: (context, state) {
            if (state is AnimalsError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Sorry, something went wrong ='("),
                  backgroundColor: AppColors.errorColor,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is AnimalsLoading) {
              return const AnimalsLoadingScreen();
            }
            if (state is AnimalsSuccess) {
              return animalSuccessScreen(context, state);
            }

            return AnimalSearchScreen(animalcontroller: animalcontroller);
          },
        ),
      ),
    );
  }

  Column animalSuccessScreen(BuildContext context, AnimalsSuccess state) {
    return Column(
      children: [
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(AppDimens.s),
              child: ListView.builder(
                itemCount: state.animalsModel.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return animalCard(state.animalsModel[index], context);
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network(
                              state.animalsModel[index].imageLink.toString(),
                              width: 150,
                              height: 150,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  // const Text('Name:',
                                  //     style: AppTypography.h2),
                                  Text(
                                      state.animalsModel[index].name.toString(),
                                      textAlign: TextAlign.center,
                                      style: AppTypography.h2),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FavoriteButton(
                                        iconSize: 50,
                                        isFavorite: favorite,
                                        // iconDisabledColor: Colors.white,
                                        valueChanged: (_isFavorite) {
                                          favorite = _isFavorite;
                                          print('Is Favorite : $favorite');
                                        },
                                      ),
                                      StarButton(
                                        iconSize: 50,
                                        isStarred: star,
                                        // iconDisabledColor: Colors.white,
                                        valueChanged: (starValue) {
                                          if (starValue == true) {
                                            animalBox
                                                .add(state.animalsModel[index]);
                                          } else if (starValue == false) {
                                            animalBox.delete(
                                                state.animalsModel[index]);
                                          }
                                          star = starValue;
                                          print('Is Starred : $star');
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )),
        ),
        Container(
          color: AppColors.dialogBlack,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 8, 0, 0),
            child: Row(
              children: [
                SizedBox(
                  width: 280,
                  height: 70,
                  child: TextField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                    ],
                    controller: animalcontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Write number between 1-9",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.mainColor),
                        borderRadius: BorderRadius.circular(AppRadius.xm),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: AppDimens.ms),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: ElevatedButton(
                      onPressed: () {
                        final animalNumber = int.parse(animalcontroller.text);
                        if (animalNumber != 0) {
                          context
                              .read<AnimalsCubit>()
                              .getAnimalsModel(animalNumber);

                          context
                              .read<AnimalsCubit>()
                              .saveAnimalData(animalNumber);
                          context
                              .read<AnimalsCubit>()
                              .saveDataFromMemory(animalNumber);
                          animalcontroller.clear();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Value must be between 1-9'),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: AppColors.mainColor,
                      ),
                      child: const Text('Go!')),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
