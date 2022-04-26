import 'package:animals/model/animal_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row AnimalType(AnimalModel animalModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Animal type:',
        style: AppTypography.body1,
      ),
      Text(
        animalModel.animalType.toString(),
        style: AppTypography.body1,
      ),
    ],
  );
}
