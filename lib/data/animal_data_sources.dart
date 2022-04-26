// import 'package:animals/model/animal_model.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';

// part 'animal_data_sources.g.dart';

// @RestApi(baseUrl: "https://zoo-animal-api.herokuapp.com")
// abstract class AnimalRemoteDataSource {
//   factory AnimalRemoteDataSource(Dio dio, {String baseUrl}) =
//       _AnimalRemoteDataSource;

//   @GET("/animals/rand/")
//   Future<AnimalModel> getAnimal();
// }
import 'package:dio/dio.dart';

class AnimalRemoteDataSource {
  Future<Map<String, dynamic>?> getAnimal() async {
    try {
      final response = await Dio().get<Map<String, dynamic>>(
          'https://zoo-animal-api.herokuapp.com/animals/rand/');
      return response.data;
    } on DioError catch (error) {
      throw Exception(
          error.response?.data['error']['message'] ?? 'Unkown error');
    }
  }
}
