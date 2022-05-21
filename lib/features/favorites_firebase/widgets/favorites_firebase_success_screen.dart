import 'package:animals/features/favorites_firebase/widgets/animal_card_firebase.dart';
import 'package:animals/features/favorites_firebase/widgets/animal_details_card_firebase.dart';
import 'package:animals/models/firebase_animals_model.dart';
import 'package:flutter/material.dart';

class FavoritesFirebaseSuccessScreen extends StatelessWidget {
  const FavoritesFirebaseSuccessScreen({
    Key? key,
    required this.animalModel,
  }) : super(key: key);

  final List<FirebaseAnimalsModel> animalModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: animalModel.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AnimalDetailsCardFirebase(
                    animalModel: animalModel,
                    index: index,
                  );
                },
              );
            },
            child: AnimalCardFirebase(
              animalModel: animalModel,
              index: index,
            ),
          );
        });
  }
}
