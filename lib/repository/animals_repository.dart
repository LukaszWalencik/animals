import 'package:animals/data/animals_data_sources.dart';
import 'package:animals/model/animals_model.dart';

class AnimalsRepository {
  final AnimalsRemoteDataSource _animalsRemoteDataSource;

  AnimalsRepository(this._animalsRemoteDataSource);

  Future<List<AnimalsModel>> getAnimalsModel() async {
    final getterAnimalModel = await _animalsRemoteDataSource.getAnimals();
    return getterAnimalModel;
  }
}
