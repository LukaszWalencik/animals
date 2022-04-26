import 'package:animals/model/animal_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row Habitat(AnimalModel animalModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Habitat:',
        style: AppTypography.body1,
      ),
      Text(
        animalModel.habitat.toString(),
        style: AppTypography.body1,
      ),
    ],
  );
}
