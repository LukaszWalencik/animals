import 'package:animals/data/animal_data_sources.dart';
import 'package:animals/model/animal_model.dart';

class AnimalRepository {
  final AnimalRemoteDataSource _animalRemoteDataSource;

  AnimalRepository(this._animalRemoteDataSource);

  Future<AnimalModel?> getAnimalModel() async {
    final getterAnimalModel = await _animalRemoteDataSource.getAnimal();
    if (getterAnimalModel == null) {
      return null;
    }
    return AnimalModel.fromJson(getterAnimalModel);
  }
}
