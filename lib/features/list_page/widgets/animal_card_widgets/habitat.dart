import 'package:animals/models/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Column habitat(AnimalsModel animalsModel) {
  return Column(
    children: [
      const Text(
        'Habitat:',
        style: AppTypography.body2bold,
      ),
      Text(
        animalsModel.habitat.toString(),
        style: AppTypography.body2bold,
      ),
    ],
  );
}
