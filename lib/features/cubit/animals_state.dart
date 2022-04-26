part of 'animals_cubit.dart';

class AnimalsState {
  final AnimalModel? animalModel;
  final Status status;
  final String? errorMessage;

  AnimalsState(
      {this.animalModel, this.status = Status.initial, this.errorMessage});
}
