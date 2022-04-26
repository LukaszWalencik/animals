import 'package:animals/features/home_page/widget/widgets/active_time.dart';
import 'package:animals/features/home_page/widget/widgets/animal_type.dart';
import 'package:animals/features/home_page/widget/widgets/diet.dart';
import 'package:animals/features/home_page/widget/widgets/geo_range.dart';
import 'package:animals/features/home_page/widget/widgets/habitat.dart';
import 'package:animals/features/home_page/widget/widgets/latin_name.dart';
import 'package:animals/features/home_page/widget/widgets/lenght_maximum.dart';
import 'package:animals/features/home_page/widget/widgets/lenght_minimum.dart';
import 'package:animals/features/home_page/widget/widgets/life_span.dart';
import 'package:animals/features/home_page/widget/widgets/name.dart';
import 'package:animals/features/home_page/widget/widgets/weight_maximum.dart';
import 'package:animals/features/home_page/widget/widgets/weight_minimum.dart';
import 'package:animals/model/animal_model.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:flutter/material.dart';

Container AnimalCard(AnimalModel animalModel) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black12,
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(Dimens.xxxl),
        bottomRight: Radius.circular(Dimens.xxxl),
      ),
      border: Border.all(
        width: 3,
        color: Colors.black,
        style: BorderStyle.solid,
      ),
    ),
    // color: Color.fromARGB(255, 197, 197, 197),
    child: Padding(
      padding: const EdgeInsets.all(Dimens.xm),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            animalModel.imageLink.toString(),
            width: 320,
            height: 320,
          ),
          SizedBox(height: (Dimens.s)),
          Name(animalModel),
          SizedBox(height: (Dimens.s)),
          LatinName(animalModel),
          SizedBox(height: (Dimens.s)),
          AnimalType(animalModel),
          SizedBox(height: (Dimens.s)),
          ActiveTime(animalModel),
          SizedBox(height: (Dimens.s)),
          LenghtMinimum(animalModel),
          SizedBox(height: (Dimens.s)),
          LenghtMaximum(animalModel),
          SizedBox(height: (Dimens.s)),
          WeightMinimum(animalModel),
          SizedBox(height: (Dimens.s)),
          WeightMaximum(animalModel),
          SizedBox(height: (Dimens.s)),
          LifeSpan(animalModel),
          SizedBox(height: (Dimens.s)),
          Habitat(animalModel),
          SizedBox(height: (Dimens.s)),
          Diet(animalModel),
          SizedBox(height: (Dimens.s)),
          GeoRange(animalModel),
        ],
      ),
    ),
  );
}
