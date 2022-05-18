import 'package:animals/models/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Widget nameBox(
    {required AnimalsModel animalsModel,
    required String text,
    required String body}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: AppTypography.h3,
      ),
      Text(
        body,
        style: AppTypography.h3,
      ),
    ],
  );
}
