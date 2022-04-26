import 'package:animals/model/animal_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row LenghtMinimum(AnimalModel animalModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Lenght minimum:',
        style: AppTypography.body1,
      ),
      Text(
        animalModel.lengthMin.toString(),
        style: AppTypography.body1,
      ),
    ],
  );
}
