import 'package:animals/model/animal_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row Name(AnimalModel animalModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Name:',
        style: AppTypography.h1,
      ),
      Text(
        animalModel.name.toString(),
        style: AppTypography.h1,
      ),
    ],
  );
}
