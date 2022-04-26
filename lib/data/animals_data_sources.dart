import 'package:animals/model/animals_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'animals_data_sources.g.dart';

@RestApi(baseUrl: "https://zoo-animal-api.herokuapp.com")
abstract class AnimalsRemoteDataSource {
  factory AnimalsRemoteDataSource(Dio dio, {String baseUrl}) =
      _AnimalsRemoteDataSource;

  @GET("/animals/rand/5")
  Future<List<AnimalsModel>> getAnimals();
}
