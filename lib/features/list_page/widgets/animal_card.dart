import 'package:animals/features/list_page/widgets/animal_card_widgets/favorite_button.dart';
import 'package:animals/features/list_page/widgets/animal_card_widgets/star_button.dart';
import 'package:animals/models/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/presentation/radius.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AnimalsCard extends StatelessWidget {
  const AnimalsCard({
    Key? key,
    required this.animalModel,
    required this.animalBox,
    required this.index,
  }) : super(key: key);

  final List<AnimalsModel> animalModel;
  final Box animalBox;
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Favorite(
                          animalModel: animalModel,
                          index: index,
                        ),
                        Star(
                          animalBox: animalBox,
                          animalModel: animalModel,
                          index: index,
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
  }
}
