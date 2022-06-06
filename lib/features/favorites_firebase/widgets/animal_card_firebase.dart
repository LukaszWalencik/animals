import 'dart:ui';

import 'package:animals/features/favorites_firebase/cubit/favoritesfirebase_cubit.dart';
import 'package:animals/models/firebase_animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/presentation/radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimalCardFirebase extends StatelessWidget {
  const AnimalCardFirebase({
    Key? key,
    required this.animalModel,
    required this.index,
  }) : super(key: key);

  final List<FirebaseAnimalsModel> animalModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.s),
      child: Dismissible(
        confirmDismiss: (direction) {
          return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  elevation: 1,
                  title: const Text('Are you sure to delete?'),
                  content: const Text(
                      'Do you realy want to remove this favorite animal?'),
                  actions: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text('Yes'),
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.mainColor,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text('No'),
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.mainColor,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              });
        },
        key: Key(animalModel[index].id),
        background: Container(
          padding: const EdgeInsets.only(right: AppDimens.l),
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
            color: AppColors.errorColor,
            borderRadius: const BorderRadius.all(Radius.circular(AppRadius.ms)),
            border: Border.all(
              width: 3,
              color: AppColors.black,
              style: BorderStyle.solid,
            ),
          ),
          child: const Icon(
            Icons.delete,
            color: AppColors.white,
          ),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: ((direction) {
          context
              .read<FavoritesFirebaseCubit>()
              .delete(id: animalModel[index].id);
        }),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.listElementBlack,
            borderRadius: const BorderRadius.all(Radius.circular(AppRadius.ms)),
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
                  animalModel[index].imageLink,
                  width: 150,
                  height: 150,
                ),
                Expanded(
                  child: Column(
                    children: [
                      // const Text('Name:',
                      //     style: AppTypography.h2),
                      Text(animalModel[index].name,
                          textAlign: TextAlign.center, style: AppTypography.h2),
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
      ),
    );
  }
}
