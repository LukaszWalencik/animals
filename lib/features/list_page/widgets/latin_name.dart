import 'package:animals/model/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row latinName(AnimalsModel animalsModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Latin name:',
        style: AppTypography.body2bold,
      ),
      Text(
        animalsModel.latinName.toString(),
        style: AppTypography.body2bold,
      ),
    ],
  );
}
