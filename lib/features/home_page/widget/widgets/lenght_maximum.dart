import 'package:animals/model/animal_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row LenghtMaximum(AnimalModel animalModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Lenght maximum:',
        style: AppTypography.body1,
      ),
      Text(
        animalModel.lengthMax.toString(),
        style: AppTypography.body1,
      ),
    ],
  );
}
