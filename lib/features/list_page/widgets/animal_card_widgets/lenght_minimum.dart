import 'package:animals/models/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row lenghtMinimum(AnimalsModel animalsModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Lenght minimum:',
        style: AppTypography.body2bold,
      ),
      Text(
        animalsModel.lengthMin.toString(),
        style: AppTypography.body2bold,
      ),
    ],
  );
}
