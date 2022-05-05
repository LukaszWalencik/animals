import 'package:animals/model/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Column geoRange(AnimalsModel animalsModel) {
  return Column(
    children: [
      const Text(
        'Geography range:',
        style: AppTypography.body2bold,
      ),
      Text(
        animalsModel.geoRange.toString(),
        style: AppTypography.body2bold,
      ),
    ],
  );
}
