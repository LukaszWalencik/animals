part of 'animals_cubit.dart';

class AnimalState {
  final AnimalModel? animalModel;
  final Status status;
  final String? errorMessage;

  AnimalState(
      {this.animalModel, this.status = Status.initial, this.errorMessage});
}
