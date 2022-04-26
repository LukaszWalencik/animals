import 'package:animals/model/animal_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Column Diet(AnimalModel animalModel) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Diet:',
        style: AppTypography.body1,
      ),
      Text(
        animalModel.diet.toString(),
        style: AppTypography.body1,
      ),
    ],
  );
}
