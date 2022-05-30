import 'package:animals/models/animals_model.dart';
import 'package:animals/presentation/colors.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Star extends StatelessWidget {
  const Star({
    Key? key,
    required this.animalBox,
    required this.animalModel,
    required this.index,
  }) : super(key: key);

  final Box animalBox;
  final List<AnimalsModel> animalModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return StarButton(
      iconColor: const Color.fromARGB(255, 255, 196, 0),
      iconSize: 50,
      valueChanged: (starValue) {
        if (starValue == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: AppColors.success,
              content: Text('Successful add this animal to hive favorites'),
            ),
          );
          animalBox.put(index, animalModel[index]);
          // animalBox.clear();
        } else if (starValue == false) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: AppColors.errorColor,
              content: Text('Successful remove this animal to hive favorites'),
            ),
          );
          animalBox.delete(animalModel[index]);
        }
        print(animalBox.get(index));
        print('Is Starred : $starValue');
      },
    );
  }
}
