import 'package:animals/features/favorites_hive/widgets/animals_details_card_hive_widgets/image_hive.dart';
import 'package:animals/features/favorites_hive/widgets/animals_details_card_hive_widgets/information_column_hive.dart';
import 'package:animals/features/favorites_hive/widgets/animals_details_card_hive_widgets/information_row_hive.dart';
import 'package:animals/features/favorites_hive/widgets/animals_details_card_hive_widgets/name_box_hive.dart';
import 'package:animals/models/animals_model.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/presentation/radius.dart';
import 'package:flutter/material.dart';

class AnimalDetailsCardHive extends StatelessWidget {
  const AnimalDetailsCardHive({
    Key? key,
    required this.animals,
  }) : super(key: key);

  final AnimalsModel animals;

  @override
  Widget build(BuildContext context) {
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
                image(text: animals.imageLink),
                const SizedBox(height: (AppDimens.s)),
                nameBox(name: 'Name:', body: animals.name),
                const SizedBox(height: (AppDimens.s)),
                informationRow(
                  text: 'Latin name:',
                  body: animals.latinName,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationRow(
                  text: 'Animal type:',
                  body: animals.animalType,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationRow(
                  text: 'Active time:',
                  body: animals.activeTime,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationRow(
                  text: 'Lenght minimum:',
                  body: animals.lengthMin,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationRow(
                  text: 'Lenght maximum:',
                  body: animals.lengthMax,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationRow(
                  text: 'Weight minimum:',
                  body: animals.weightMin,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationRow(
                  text: 'Weight maximum:',
                  body: animals.weightMax,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationRow(
                  text: 'Life span:',
                  body: animals.lifespan,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationColumn(
                  text: 'Habitat:',
                  body: animals.habitat,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationColumn(
                  text: 'Diet:',
                  body: animals.diet,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationColumn(
                  text: 'Geography range:',
                  body: animals.geoRange,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.mainColor,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('I read all, let me out :)'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
