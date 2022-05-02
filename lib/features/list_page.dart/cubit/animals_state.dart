part of 'animals_cubit.dart';

// class AnimalsState {
//   final List<AnimalsModel> animalsModel;
//   final Status status;
//   final String? errorMessage;

//   AnimalsState(
//       {this.animalsModel = const [],
//       this.status = Status.initial,
//       this.errorMessage});
// }

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
  const AnimalsSuccess(this.animalsModel);
}

class AnimalsError extends AnimalsState {
  final String message;
  const AnimalsError(this.message);
}
