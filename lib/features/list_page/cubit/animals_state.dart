part of 'animals_cubit.dart';

abstract class AnimalsState {
  const AnimalsState();
}

class AnimalsInitial extends AnimalsState {
  const AnimalsInitial();
}

class AnimalsLoading extends AnimalsState {
  const AnimalsLoading();
}

class AnimalsSuccess extends AnimalsState {
  final List<AnimalsModel> animalsModel;
  // final Weather weather;
  const AnimalsSuccess({required this.animalsModel});
}

class AnimalsError extends AnimalsState {
  final String message;
  const AnimalsError(this.message);
}
