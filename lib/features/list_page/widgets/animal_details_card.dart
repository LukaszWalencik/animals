import 'package:animals/features/list_page/widgets/animal_details_card_widgets/information_column.dart';
import 'package:animals/features/list_page/widgets/animal_details_card_widgets/information_row.dart';
import 'package:animals/features/list_page/widgets/animal_details_card_widgets/name_box.dart';
import 'package:animals/models/animals_model.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/presentation/radius.dart';
import 'package:flutter/material.dart';

Dialog animalDetailsCard(AnimalsModel animals, BuildContext context) {
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
              nameBox(
                animalsModel: animals,
                text: 'Name:',
                body: animals.name,
              ),
              const SizedBox(height: (AppDimens.s)),
              informationRow(
                  animalsModel: animals,
                  text: 'Latin name:',
                  body: animals.latinName),
              const SizedBox(height: (AppDimens.s)),
              informationRow(
                  animalsModel: animals,
                  text: 'Animal type:',
                  body: animals.animalType),
              // animalType(animals),
              const SizedBox(height: (AppDimens.s)),
              informationRow(
                  animalsModel: animals,
                  text: 'Active time:',
                  body: animals.activeTime),
              // activeTime(animals),
              const SizedBox(height: (AppDimens.s)),
              informationRow(
                  animalsModel: animals,
                  text: 'Lenght minimum:',
                  body: animals.lengthMin),
              // lenghtMinimum(animals),
              const SizedBox(height: (AppDimens.s)),
              informationRow(
                  animalsModel: animals,
                  text: 'Lenght maximum:',
                  body: animals.lengthMax),
              // lenghtMaximum(animals),
              const SizedBox(height: (AppDimens.s)),
              informationRow(
                  animalsModel: animals,
                  text: 'Weight minimum:',
                  body: animals.weightMin),
              // weightMinimum(animals),
              const SizedBox(height: (AppDimens.s)),
              informationRow(
                  animalsModel: animals,
                  text: 'Weight maximum:',
                  body: animals.weightMax),
              // weightMaximum(animals),
              const SizedBox(height: (AppDimens.s)),
              informationRow(
                  animalsModel: animals,
                  text: 'Life span:',
                  body: animals.lifespan),
              // lifeSpan(animals),
              const SizedBox(height: (AppDimens.s)),
              informationColumn(
                  animalsModel: animals,
                  text: 'Habitat:',
                  body: animals.habitat),
              // habitat(animals),
              const SizedBox(height: (AppDimens.s)),
              informationColumn(
                  animalsModel: animals, text: 'Diet:', body: animals.diet),
              // diet(animals),
              const SizedBox(height: (AppDimens.s)),
              informationColumn(
                  animalsModel: animals,
                  text: 'Geography range:',
                  body: animals.geoRange),
              // geoRange(animals),
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
