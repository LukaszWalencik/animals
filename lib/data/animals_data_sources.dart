import 'package:animals/model/animals_model.dart';
import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';

part 'animals_data_sources.g.dart';

@RestApi(baseUrl: "https://zoo-animal-api.herokuapp.com")
abstract class AnimalsRemoteDataSource {
  factory AnimalsRemoteDataSource(Dio dio, {String baseUrl}) =
      _AnimalsRemoteDataSource;

  @GET("/animals/rand/9")
  Future<List<AnimalsModel>> getAnimals();
}

// class AnimalsRemoteDataSource {
//   Future<List<Map<String, dynamic>>?> getAnimals() async {
//     try {
//       final response = await Dio().get<List<dynamic>>(
//           'https://zoo-animal-api.herokuapp.com/animals/rand/2');
//       final listDynamic = response.data;
//       if (listDynamic == null) {
//         return [];
//       }
//       return listDynamic.map((e) => e as Map<String, dynamic>).toList();
//     } on DioError catch (error) {
//       throw Exception(
//           error.response?.data['error']['message'] ?? 'Unkown error');
//     }
//   }
// }
