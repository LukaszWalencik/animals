import 'package:animals/data/animals_data_sources.dart';
import 'package:animals/models/animals_model.dart';

class AnimalsRepository {
  AnimalsRepository(this._animalsRemoteDataSource);

  final AnimalsRemoteDataSource _animalsRemoteDataSource;

  Future<List<AnimalsModel>> getAnimalsModel(
      {required int animalNumber}) async {
    return _animalsRemoteDataSource.getAnimals(animalNumber);
  }
}
