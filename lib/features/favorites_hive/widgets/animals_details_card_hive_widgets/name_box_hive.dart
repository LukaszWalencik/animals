import 'package:animals/presentation/app_typography.dart';
import 'package:flutter/material.dart';

Widget nameBox({required String name, required String body}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        name,
        style: AppTypography.h3,
      ),
      Text(
        body,
        style: AppTypography.h3,
      ),
    ],
  );
}
