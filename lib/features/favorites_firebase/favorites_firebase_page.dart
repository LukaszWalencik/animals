import 'package:animals/features/favorites_firebase/cubit/favoritesfirebase_cubit.dart';
import 'package:animals/features/favorites_firebase/cubit/favoritesfirebase_state.dart';
import 'package:animals/features/favorites_firebase/widgets/favorites_firebase_loading_screen.dart';
import 'package:animals/features/favorites_firebase/widgets/favorites_firebase_success_screen.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/repository/favorite_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesFirebase extends StatelessWidget {
  const FavoritesFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => FavoritesFirebaseCubit(
          AnimalsFirebaseRepository(),
        )..start(),
        child: BlocConsumer<FavoritesFirebaseCubit, FavoritesFirebaseState>(
          listener: (context, state) {
            if (state is FavoritesFirebaseError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Sorry, something went wrong ='("),
                  backgroundColor: AppColors.errorColor,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is FavoritesFirebaseLoading) {
              return const FavoritesFirebaseLoadingScreen();
            }
            if (state is FavoritesFirebaseSuccess) {
              final animalModel = state.favoriteAnimal;
              return FavoritesFirebaseSuccessScreen(animalModel: animalModel);
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Text('Add some animals to favorites')],
              ),
            );
          },
        ),
      ),
    );
  }
}
