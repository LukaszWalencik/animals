import 'package:animals/model/animal_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row LatinName(AnimalModel animalModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Latin name:',
        style: AppTypography.body1,
      ),
      Text(
        animalModel.latinName.toString(),
        style: AppTypography.body1,
      ),
    ],
  );
}
