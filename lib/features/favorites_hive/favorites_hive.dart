import 'package:animals/features/list_page/cubit/animals_cubit.dart';
import 'package:animals/models/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/presentation/radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesHive extends StatelessWidget {
  const FavoritesHive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animalBox = Hive.box('animalsbox');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: animalBox.length,
          itemBuilder: (context, index) {
            final animals = animalBox.get(index) as AnimalsModel;
            print(animalBox.length);
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
                            borderRadius: BorderRadius.circular(AppRadius.xm),
                            color: AppColors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppDimens.s),
                            child: Column(
                              children: [
                                Image.network(
                                  animals.imageLink.toString(),
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
                                      animals.name.toString(),
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
                                      animals.latinName.toString(),
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
                                      animals.animalType.toString(),
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
                                      animals.activeTime.toString(),
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
                                      animals.lengthMin.toString(),
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
                                      animals.lengthMax.toString(),
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
                                      animals.weightMin.toString(),
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
                                      animals.weightMax.toString(),
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
                                      'Life span:',
                                      style: AppTypography.body2bold,
                                    ),
                                    Text(
                                      animals.lifespan.toString(),
                                      style: AppTypography.body2bold,
                                    ),
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
                                      animals.habitat.toString(),
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
                                      animals.diet.toString(),
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
                                      animals.geoRange.toString(),
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
                                    child:
                                        const Text('I read all, let me out :)'))
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
                        animals.imageLink.toString(),
                        width: 150,
                        height: 150,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // const Text('Name:',
                            //     style: AppTypography.h2),
                            Text(animals.name.toString(),
                                textAlign: TextAlign.center,
                                style: AppTypography.h2),
                            IconButton(
                                color: AppColors.errorColor,
                                onPressed: () {
                                  context
                                      .read<AnimalsCubit>()
                                      .deleteFromHive(index);
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
          }),
    );
  }
}
