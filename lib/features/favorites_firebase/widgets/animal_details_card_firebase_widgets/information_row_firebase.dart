import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Widget informationRow({required String text, required String body}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        // 'Latin name:',
        style: AppTypography.body2bold,
      ),
      Text(
        body,
        // animalModel[index].latinName,
        style: AppTypography.body2bold,
      ),
    ],
  );
}
