import 'package:animals/features/list_page/cubit/animals_cubit.dart';
import 'package:animals/models/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/presentation/radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimalCardHive extends StatelessWidget {
  const AnimalCardHive({Key? key, required this.animals, required this.index})
      : super(key: key);

  final AnimalsModel animals;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.listElementBlack,
        borderRadius: const BorderRadius.all(Radius.circular(AppRadius.ms)),
        border: Border.all(
          width: 3,
          color: AppColors.black,
          style: BorderStyle.solid,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.s),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              animals.imageLink,
              width: 150,
              height: 150,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // const Text('Name:',
                  //     style: AppTypography.h2),
                  Text(animals.name,
                      textAlign: TextAlign.center, style: AppTypography.h2),
                  IconButton(
                      color: AppColors.errorColor,
                      onPressed: () {
                        context.read<AnimalsCubit>().deleteFromHive(index);
                      },
                      icon: const Icon(Icons.delete))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
