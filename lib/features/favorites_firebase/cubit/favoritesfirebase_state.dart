import 'package:animals/model/animals_model.dart';

class FavoritesFirebaseState {
  const FavoritesFirebaseState({
    required this.favoriteAnimal,
    required this.isLoading,
    required this.errorMessage,
  });

  final List<AnimalsModel> favoriteAnimal;
  final bool isLoading;
  final String errorMessage;
}
