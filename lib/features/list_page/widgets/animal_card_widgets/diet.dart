import 'package:animals/models/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Column diet(AnimalsModel animalsModel) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Diet:',
        style: AppTypography.body2bold,
      ),
      Text(
        animalsModel.diet.toString(),
        style: AppTypography.body2bold,
      ),
    ],
  );
}
