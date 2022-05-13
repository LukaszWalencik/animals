import 'package:animals/models/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row name(AnimalsModel animalsModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        'Name:',
        style: AppTypography.h3,
      ),
      Text(
        animalsModel.name.toString(),
        style: AppTypography.h3,
      ),
    ],
  );
}
