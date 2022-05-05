import 'package:animals/model/animals_model.dart';
import 'package:animals/repository/animals_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'animals_state.dart';

class AnimalsCubit extends Cubit<AnimalsState> {
  final AnimalsRepository _animalsRepository;

  AnimalsCubit(this._animalsRepository) : super(const AnimalsInitial());

  Future<void> getAnimalsModel(int animalNumber) async {
    try {
      emit(const AnimalsLoading());
      final animalsModel =
          await _animalsRepository.getAnimalsModel(animalNumber: animalNumber);
      emit(AnimalsSuccess(animalsModel));
    } catch (error) {
      emit(
        const AnimalsError('Something went wrong'),
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

  Future<void> saveDataFromMemory(int animalNumber) async {
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    final animalsModel =
        await _animalsRepository.getAnimalsModel(animalNumber: animalNumber);
    final animals = animalsModel;
    for (final animal in animals) {
      await prefs.setString('name', animal.name);
    }
  }

  // Future<void> readDataFromMemory(int animalNumber) async {
  //   // Obtain shared preferences.
  //   final prefs = await SharedPreferences.getInstance();
  //   final animalsModel =
  //       await _animalsRepository.getAnimalsModel(animalNumber: animalNumber);
  //   final animals = animalsModel;
  //   for (final animal in animals) {
  //     final String? name = prefs.getString('name');
  //     print(name);
  //   }
  // }

}
