import 'package:animals/model/animal_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Column GeoRange(AnimalModel animalModel) {
  return Column(
    children: [
      Text(
        'Geography range:',
        style: AppTypography.body1,
      ),
      Text(
        animalModel.geoRange.toString(),
        overflow: TextOverflow.ellipsis,
        style: AppTypography.body1,
      ),
    ],
  );
}
