import 'package:animals/core/enums.dart';
import 'package:animals/model/animal_model.dart';
import 'package:animals/repository/animal_repository.dart';
import 'package:bloc/bloc.dart';

part 'animals_state.dart';

class AnimalCubit extends Cubit<AnimalState> {
  AnimalCubit(this._animalRepository) : super(AnimalState());

  final AnimalRepository _animalRepository;

  Future<void> getAnimalModel() async {
    emit(AnimalState(status: Status.loading));

    try {
      final animalModel = await _animalRepository.getAnimalModel();
      emit(AnimalState(animalModel: animalModel, status: Status.success));
    } catch (error) {
      emit(AnimalState(status: Status.error, errorMessage: 'Błąd'));
    }
  }
}
