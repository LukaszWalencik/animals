import 'package:animals/presentation/colors.dart';
import 'package:flutter/material.dart';

class AppTypography {
  static const h1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    height: 1.33,
  );
  static const h2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    height: 1.4,
  );
  static const h3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    height: 1.4,
  );
  static const body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 1.5,
  );
  static const body2bold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    height: 1.5,
  );
  static const body3bold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    height: 1.5,
  );

  static const caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    height: 1.33,
  );

  static const labelTextStyle = TextStyle(
    color: AppColors.labelTextColor,
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.33,
  );
}
