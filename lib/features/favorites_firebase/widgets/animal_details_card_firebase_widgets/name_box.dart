import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Widget nameBox({required String name, required String body}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        name,
        // 'Name:',
        style: AppTypography.h3,
      ),
      Text(
        body,
        // animalModel[index].name,
        style: AppTypography.h3,
      ),
    ],
  );
}
