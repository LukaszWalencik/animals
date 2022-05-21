import 'package:animals/models/animals_model.dart';
import 'package:animals/repository/animals_repository.dart';
import 'package:animals/repository/favorite_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'animals_state.dart';

class AnimalsCubit extends Cubit<AnimalsState> {
  final AnimalsRepository _animalsRepository;
  final AnimalsFirebaseRepository _animalsFirebaseRepository;

  AnimalsCubit(this._animalsRepository, this._animalsFirebaseRepository)
      : super(const AnimalsInitial());

  Future<void> getAnimalsModel(int animalNumber) async {
    try {
      emit(const AnimalsLoading());
      final animalsModel =
          await _animalsRepository.getAnimalsModel(animalNumber: animalNumber);
      emit(AnimalsSuccess(animalsModel: animalsModel));
    } catch (error) {
      emit(
        const AnimalsError('Something went wrong'),
      );
    }
  }

  void deleteFromHive(int index) {
    final animalBox = Hive.box('animalsbox');
    animalBox.deleteAt(index);
  }
  // Future<void> saveAnimalData(int animalNumber) async {
  //   final animalsModel =
  //       await _animalsRepository.getAnimalsModel(animalNumber: animalNumber);
  //   final box = Hive.box('animalsbox');
  //   // final List<AnimalsModel> animalsModel;
  //   final animals = animalsModel;
  //   box.add(animals);
  //   print(animals);
  // }

  // Future<void> saveDataFromMemory(int animalNumber) async {
  //   // Obtain shared preferences.
  //   final prefs = await SharedPreferences.getInstance();
  //   final animalsModel =
  //       await _animalsRepository.getAnimalsModel(animalNumber: animalNumber);
  //   final animals = animalsModel;
  //   for (final animal in animals) {
  //     await prefs.setString('name', animal.name);
  //   }
  // }

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
  Future<void> add({
    required int animalId,
    required String name,
    required String latinName,
    required String animalType,
    required String activeTime,
    required String lengthMin,
    required String lengthMax,
    required String weightMin,
    required String weightMax,
    required String lifespan,
    required String habitat,
    required String diet,
    required String geoRange,
    required String imageLink,
    // required int id,
  }) async {
    try {
      await _animalsFirebaseRepository.add(
          animalId,
          name,
          latinName,
          animalType,
          activeTime,
          lengthMin,
          lengthMax,
          weightMin,
          weightMax,
          lifespan,
          habitat,
          diet,
          geoRange,
          imageLink);
    } catch (error) {
      emit(const AnimalsError('Something went wrong'));
    }
  }
}
