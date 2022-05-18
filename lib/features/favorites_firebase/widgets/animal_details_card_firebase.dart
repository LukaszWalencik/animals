import 'package:animals/features/favorites_firebase/widgets/animal_details_card_firebase_widgets/image_firebase.dart';
import 'package:animals/features/favorites_firebase/widgets/animal_details_card_firebase_widgets/information_column_firebase.dart';
import 'package:animals/features/favorites_firebase/widgets/animal_details_card_firebase_widgets/information_row_firebase.dart';
import 'package:animals/features/favorites_firebase/widgets/animal_details_card_firebase_widgets/name_box.dart';
import 'package:animals/models/firebase_animals_model.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/presentation/radius.dart';
import 'package:flutter/material.dart';

class AnimalDetailsCardFirebase extends StatelessWidget {
  const AnimalDetailsCardFirebase({
    Key? key,
    required this.animalModel,
    required this.index,
  }) : super(key: key);

  final List<FirebaseAnimalsModel> animalModel;
  final int index;
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
                image(text: animalModel[index].imageLink),
                const SizedBox(height: (AppDimens.s)),
                nameBox(
                  name: 'Name: ',
                  body: animalModel[index].name,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationRow(
                  text: 'Latin name:',
                  body: animalModel[index].latinName,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationRow(
                  text: 'Animal type:',
                  body: animalModel[index].animalType,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationRow(
                  text: 'Active time:',
                  body: animalModel[index].activeTime,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationRow(
                  text: 'Lenght minimum:',
                  body: animalModel[index].lengthMin,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationRow(
                  text: 'Lenght maximum:',
                  body: animalModel[index].lengthMax,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationRow(
                  text: 'Weight minimum:',
                  body: animalModel[index].weightMin,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationRow(
                  text: 'Weight maximum:',
                  body: animalModel[index].weightMax,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationRow(
                  text: 'Life span:',
                  body: animalModel[index].lifespan,
                ),
                const SizedBox(height: (AppDimens.s)),
                informationColumn(
                    text: 'Habitat:', body: animalModel[index].habitat),
                const SizedBox(height: (AppDimens.s)),
                informationColumn(text: 'Diet:', body: animalModel[index].diet),
                const SizedBox(height: (AppDimens.s)),
                informationColumn(
                    text: 'Geography range:',
                    body: animalModel[index].geoRange),
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
