import 'package:animals/models/firebase_animals_model.dart';

class FavoritesFirebaseState {
  const FavoritesFirebaseState({
    required this.favoriteAnimal,
    required this.isLoading,
    required this.errorMessage,
  });

  final List<FirebaseAnimalsModel> favoriteAnimal;
  final bool isLoading;
  final String errorMessage;
}
