import 'package:animals/model/animal_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row WeightMinimum(AnimalModel animalModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Weight minimum:',
        style: AppTypography.body1,
      ),
      Text(
        animalModel.weightMin.toString(),
        style: AppTypography.body1,
      ),
    ],
  );
}
