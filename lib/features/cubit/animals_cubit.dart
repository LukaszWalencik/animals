import 'package:animals/core/enums.dart';
import 'package:animals/features/list_page.dart/cubit/animals_cubit.dart';
import 'package:animals/model/animals_model.dart';
import 'package:animals/repository/animals_repository.dart';
import 'package:bloc/bloc.dart';

part 'animals_state.dart';

class AnimalsCubit extends Cubit<AnimalsState> {
  AnimalsCubit(this._animalRepository) : super(AnimalsState());

  final AnimalsRepository _animalRepository;

  Future<void> getAnimalModel() async {
    emit(AnimalsState(status: Status.loading));

    try {
      final animalModel = await _animalRepository.getAnimalsModel();
      emit(AnimalsState(animalsModel: animalModel, status: Status.success));
    } catch (error) {
      emit(AnimalsState(status: Status.error, errorMessage: 'Błąd'));
    }
  }
}
