import 'package:animals/model/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Row activeTime(AnimalsModel animalsModel) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Active time:',
          style: AppTypography.body2bold,
        ),
        Text(
          animalsModel.activeTime.toString(),
          style: AppTypography.body2bold,
        ),
      ],
    );
