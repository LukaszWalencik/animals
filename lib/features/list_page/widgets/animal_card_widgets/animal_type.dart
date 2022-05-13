import 'package:animals/models/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row animalType(AnimalsModel animalsModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Animal type:',
        style: AppTypography.body2bold,
      ),
      Text(
        animalsModel.animalType.toString(),
        style: AppTypography.body2bold,
      ),
    ],
  );
}
