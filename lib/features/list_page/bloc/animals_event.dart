part of 'animals_bloc.dart';

@immutable
abstract class AnimalsEvent {}

class GetAnimalsModel extends AnimalsEvent {
  final int animalNumber;

  GetAnimalsModel(this.animalNumber);
}
