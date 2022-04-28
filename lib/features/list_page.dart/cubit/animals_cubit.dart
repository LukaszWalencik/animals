import 'package:animals/core/enums.dart';
import 'package:animals/model/animals_model.dart';
import 'package:animals/repository/animals_repository.dart';
import 'package:bloc/bloc.dart';

part 'animals_state.dart';

class AnimalsCubit extends Cubit<AnimalsState> {
  AnimalsCubit(this._animalsRepository) : super(AnimalsState());

  final AnimalsRepository _animalsRepository;

  Future<void> getAnimalsModel() async {
    emit(
      AnimalsState(status: Status.loading),
    );
    final animalsModel = await _animalsRepository.getAnimalsModel();
    try {
      emit(
        AnimalsState(status: Status.success, animalsModel: animalsModel),
      );
    } catch (error) {
      emit(
        AnimalsState(status: Status.error, errorMessage: 'Błąd'),
      );
    }
  }
}
