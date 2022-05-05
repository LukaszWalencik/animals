import 'package:animals/features/list_page/widgets/active_time.dart';
import 'package:animals/features/list_page/widgets/animal_type.dart';
import 'package:animals/features/list_page/widgets/diet.dart';
import 'package:animals/features/list_page/widgets/geo_range.dart';
import 'package:animals/features/list_page/widgets/habitat.dart';
import 'package:animals/features/list_page/widgets/latin_name.dart';
import 'package:animals/features/list_page/widgets/lenght_maximum.dart';
import 'package:animals/features/list_page/widgets/lenght_minimum.dart';
import 'package:animals/features/list_page/widgets/life_span.dart';
import 'package:animals/features/list_page/widgets/name.dart';
import 'package:animals/features/list_page/widgets/weight_maximum.dart';
import 'package:animals/features/list_page/widgets/weight_minimum.dart';
import 'package:animals/model/animals_model.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/presentation/radius.dart';
import 'package:flutter/material.dart';

Dialog animalCard(AnimalsModel animals, BuildContext context) {
  return Dialog(
    backgroundColor: AppColors.transparent,
    insetPadding: const EdgeInsets.all(AppDimens.m),
    child: SingleChildScrollView(
      child: Container(
        width: 350,
        height: 750,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.xm),
          color: AppColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.s),
          child: Column(
            children: [
              Image.network(
                animals.imageLink.toString(),
                width: 200,
                height: 200,
              ),
              const SizedBox(height: (AppDimens.s)),
              name(animals),
              const SizedBox(height: (AppDimens.s)),
              latinName(animals),
              const SizedBox(height: (AppDimens.s)),
              animalType(animals),
              const SizedBox(height: (AppDimens.s)),
              activeTime(animals),
              const SizedBox(height: (AppDimens.s)),
              lenghtMinimum(animals),
              const SizedBox(height: (AppDimens.s)),
              lenghtMaximum(animals),
              const SizedBox(height: (AppDimens.s)),
              weightMinimum(animals),
              const SizedBox(height: (AppDimens.s)),
              weightMaximum(animals),
              const SizedBox(height: (AppDimens.s)),
              lifeSpan(animals),
              const SizedBox(height: (AppDimens.s)),
              habitat(animals),
              const SizedBox(height: (AppDimens.s)),
              diet(animals),
              const SizedBox(height: (AppDimens.s)),
              geoRange(animals),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.mainColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('I read all, let me out :)'))
            ],
          ),
        ),
      ),
    ),
  );
}
