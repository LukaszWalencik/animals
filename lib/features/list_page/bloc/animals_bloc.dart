import 'package:animals/models/animals_model.dart';
import 'package:animals/repository/animals_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'animals_event.dart';
part 'animals_state.dart';

class AnimalsBloc extends Bloc<AnimalsEvent, AnimalsState> {
  final AnimalsRepository _animalsRepository;

  AnimalsBloc(this._animalsRepository) : super(const AnimalsInitial()) {
    on<GetAnimalsModel>((event, emit) async {
      int animalNumber = event.animalNumber;
      try {
        emit(const AnimalsLoading());
        final animalsModel = await _animalsRepository.getAnimalsModel(
            animalNumber: animalNumber);
        emit(AnimalsSuccess(animalsModel));
      } catch (error) {
        emit(
          const AnimalsError('Something went wrong'),
        );
      }
    });
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

  // Future<void> add({
  //   required String name,
  //   required String latinName,
  //   required String animalType,
  //   required String activeTime,
  //   required String lengthMin,
  //   required String lengthMax,
  //   required String weightMin,
  //   required String weightMax,
  //   required String lifespan,
  //   required String habitat,
  //   required String diet,
  //   required String geoRange,
  //   required String imageLink,
  //   required int id,
  // }) async {
  //   try {
  //     await _animalsFirebaseRepository.add(
  //         name,
  //         latinName,
  //         animalType,
  //         activeTime,
  //         lengthMin,
  //         lengthMax,
  //         weightMin,
  //         weightMax,
  //         lifespan,
  //         habitat,
  //         diet,
  //         geoRange,
  //         imageLink,
  //         id);
  //   } catch (error) {
  //     emit(AnimalsError('Something went wrong'));
  //   }
  // }

  // Future<void> delete({required String id}) async {
  //   await _animalsFirebaseRepository.remove(id: id);
  // }
}
