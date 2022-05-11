import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:flutter/material.dart';

class AnimalsLoadingScreen extends StatelessWidget {
  const AnimalsLoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Loading Knowledge!!',
            style: AppTypography.h2,
          ),
          SizedBox(height: AppDimens.l),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
