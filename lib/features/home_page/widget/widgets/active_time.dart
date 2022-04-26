import 'package:animals/model/animal_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row ActiveTime(AnimalModel animalModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Active time:',
        style: AppTypography.body1,
      ),
      Text(
        animalModel.activeTime.toString(),
        style: AppTypography.body1,
      ),
    ],
  );
}
