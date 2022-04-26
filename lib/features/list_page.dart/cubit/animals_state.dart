part of 'animals_cubit.dart';

class AnimalsState {
  final List<AnimalsModel> animalsModel;
  final Status status;
  final String? errorMessage;

  AnimalsState(
      {this.animalsModel = const [],
      this.status = Status.initial,
      this.errorMessage});
}
