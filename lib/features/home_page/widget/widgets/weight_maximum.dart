import 'package:animals/model/animal_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row WeightMaximum(AnimalModel animalModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Weight maximum:',
        style: AppTypography.body1,
      ),
      Text(
        animalModel.weightMax.toString(),
        style: AppTypography.body1,
      ),
    ],
  );
}
