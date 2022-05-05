import 'package:animals/model/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row weightMaximum(AnimalsModel animalsModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Weight maximum:',
        style: AppTypography.body2bold,
      ),
      Text(
        animalsModel.weightMax.toString(),
        style: AppTypography.body2bold,
      ),
    ],
  );
}
