import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Widget informationColumn({required String text, required String body}) {
  return Column(
    children: [
      Text(
        text,
        style: AppTypography.body2bold,
      ),
      Text(
        body,
        style: AppTypography.body2bold,
      ),
    ],
  );
}
