import 'package:animals/core/enums.dart';
import 'package:animals/model/animals_model.dart';
import 'package:animals/repository/animals_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'animals_state.dart';

// class AnimalsCubit extends Cubit<AnimalsState> {
//   AnimalsCubit(this._animalsRepository) : super(AnimalsState());

//   final AnimalsRepository _animalsRepository;

//   Future<void> getAnimalsModel(int animalNumber) async {
//     emit(
//       AnimalsState(status: Status.loading),
//     );
//     final animalsModel =
//         await _animalsRepository.getAnimalsModel(animalNumber: animalNumber);
//     try {
//       emit(
//         AnimalsState(status: Status.success, animalsModel: animalsModel),
//       );
//     } catch (error) {
//       emit(
//         AnimalsState(status: Status.error, errorMessage: 'Błąd'),
//       );
//     }
//   }

//   Future<void> addAnimals(AnimalsModel animalModel) async {
//     final box = Hive.box('animalsbox');
//     await box.add(animalModel);
//   }
// }

class AnimalsCubit extends Cubit<AnimalsState> {
  final AnimalsRepository _animalsRepository;

  AnimalsCubit(this._animalsRepository) : super(AnimalsInitial());

  Future<void> getAnimalsModel(int animalNumber) async {
    try {
      emit(AnimalsLoading());
      final animalsModel =
          await _animalsRepository.getAnimalsModel(animalNumber: animalNumber);
      emit(AnimalsSuccess(animalsModel));
    } catch (error) {
      emit(
        AnimalsError('Something went wrong'),
      );
    }
  }

  Future<void> saveAnimalData(int animalNumber) async {
    final animalsModel =
        await _animalsRepository.getAnimalsModel(animalNumber: animalNumber);
    final box = Hive.box('animalsbox');
    // final List<AnimalsModel> animalsModel;
    final animals = animalsModel;
    box.add(animals);
    print(animals);
  }
}
