import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Widget informationRow({required String text, required String body}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
