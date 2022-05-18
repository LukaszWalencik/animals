import 'package:animals/features/favorites_firebase/cubit/favoritesfirebase_cubit.dart';
import 'package:animals/features/favorites_firebase/cubit/favoritesfirebase_state.dart';
import 'package:animals/features/favorites_firebase/widgets/animal_card_firebase.dart';
import 'package:animals/features/favorites_firebase/widgets/animal_details_card_firebase.dart';
import 'package:animals/repository/favorite_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesFirebase extends StatelessWidget {
  const FavoritesFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesFirebaseCubit(
        AnimalsFirebaseRepository(),
      )..start(),
      child: BlocBuilder<FavoritesFirebaseCubit, FavoritesFirebaseState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.errorMessage),
              ],
            );
          }
          if (state.isLoading == true) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
            );
          }

          final animalModel = state.favoriteAnimal;
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
        },
      ),
    );
  }
}
