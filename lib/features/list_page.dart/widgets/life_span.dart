import 'package:animals/model/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row lifeSpan(AnimalsModel animalsModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Life span:',
        style: AppTypography.body2bold,
      ),
      Text(
        animalsModel.lifespan.toString(),
        style: AppTypography.body2bold,
      ),
    ],
  );
}
