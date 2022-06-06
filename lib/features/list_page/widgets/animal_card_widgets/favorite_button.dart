import 'package:animals/features/list_page/cubit/animals_cubit.dart';
import 'package:animals/models/animals_model.dart';
import 'package:animals/presentation/colors.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorite extends StatelessWidget {
  const Favorite({
    Key? key,
    required this.animalModel,
    required this.index,
  }) : super(key: key);

  final List<AnimalsModel> animalModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return FavoriteButton(
      iconSize: 50,
      // iconDisabledColor: Colors.white,
      valueChanged: (favorite) {
        if (favorite == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: AppColors.success,
              content: Text('Successful add this animal to firebase favorites'),
            ),
          );

          context.read<AnimalsCubit>().add(
                animalId: animalModel[index].id,
                name: animalModel[index].name,
                latinName: animalModel[index].latinName,
                animalType: animalModel[index].animalType,
                activeTime: animalModel[index].activeTime,
                lengthMin: animalModel[index].lengthMin,
                lengthMax: animalModel[index].lengthMax,
                weightMin: animalModel[index].weightMin,
                weightMax: animalModel[index].weightMax,
                lifespan: animalModel[index].lifespan,
                habitat: animalModel[index].habitat,
                diet: animalModel[index].diet,
                geoRange: animalModel[index].geoRange,
                imageLink: animalModel[index].imageLink,
              );
        } else if (favorite == false) {
          // context.read<FavoritesFirebaseCubit>().delete(id: )                                       );
        }
        print('Is Favorite : $favorite');
      },
    );
  }
}
