import 'package:animals/models/firebase_animals_model.dart';

abstract class FavoritesFirebaseState {
  const FavoritesFirebaseState();
}

class FavoritesFirebaseInitial extends FavoritesFirebaseState {
  const FavoritesFirebaseInitial();
}

class FavoritesFirebaseLoading extends FavoritesFirebaseState {
  const FavoritesFirebaseLoading();
}

class FavoritesFirebaseSuccess extends FavoritesFirebaseState {
  final List<FirebaseAnimalsModel> favoriteAnimal;
  // final Weather weather;
  const FavoritesFirebaseSuccess({required this.favoriteAnimal});
}

class FavoritesFirebaseError extends FavoritesFirebaseState {
  final String message;
  const FavoritesFirebaseError({required this.message});
}
