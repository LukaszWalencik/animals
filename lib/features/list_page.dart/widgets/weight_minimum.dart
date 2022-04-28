import 'package:animals/model/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row weightMinimum(AnimalsModel animalsModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Weight minimum:',
        style: AppTypography.body2bold,
      ),
      Text(
        animalsModel.weightMin.toString(),
        style: AppTypography.body2bold,
      ),
    ],
  );
}
