import 'package:animals/features/favorites_hive/widgets/animal_card_hive.dart';
import 'package:animals/features/favorites_hive/widgets/animal_details_card_hive.dart';
import 'package:animals/features/list_page/cubit/animals_cubit.dart';
import 'package:animals/models/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/presentation/radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesHive extends StatelessWidget {
  const FavoritesHive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animalBox = Hive.box('animalsbox');
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: animalBox.length,
          itemBuilder: (context, index) {
            final animals = animalBox.get(index) as AnimalsModel;
            print(animalBox.length);
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AnimalDetailsCardHive(animals: animals);
                  },
                );
              },
              child: AnimalCardHive(
                animals: animals,
                index: index,
              ),
            );
          }),
    );
  }
}
