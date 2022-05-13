import 'package:animals/models/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row lenghtMaximum(AnimalsModel animalsModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Lenght maximum:',
        style: AppTypography.body2bold,
      ),
      Text(
        animalsModel.lengthMax.toString(),
        style: AppTypography.body2bold,
      ),
    ],
  );
}
