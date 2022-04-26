import 'package:animals/model/animal_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row LifeSpan(AnimalModel animalModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Life span:',
        style: AppTypography.body1,
      ),
      Text(
        animalModel.lifespan.toString(),
        style: AppTypography.body1,
      ),
    ],
  );
}
