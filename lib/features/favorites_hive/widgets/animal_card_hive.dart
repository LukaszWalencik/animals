import 'package:animals/features/list_page/cubit/animals_cubit.dart';
import 'package:animals/models/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/presentation/radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimalCardHive extends StatelessWidget {
  const AnimalCardHive({Key? key, required this.animals, required this.index})
      : super(key: key);

  final AnimalsModel animals;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.s),
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
                animals.imageLink,
                width: 150,
                height: 150,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // const Text('Name:',
                    //     style: AppTypography.h2),
                    Text(animals.name,
                        textAlign: TextAlign.center, style: AppTypography.h2),
                    IconButton(
                        color: AppColors.errorColor,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  elevation: 1,
                                  title: const Text('Are you sure to delete?'),
                                  content: const Text(
                                      'Do you realy want to remove this favorite animal?'),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                          context.read<AnimalsCubit>().deleteFromHive(index);
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
  }
}
