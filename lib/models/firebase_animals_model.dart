// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'firebase_animals_model.freezed.dart';
// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
part 'firebase_animals_model.g.dart';

@freezed
class FirebaseAnimalsModel with _$FirebaseAnimalsModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory FirebaseAnimalsModel({
    required String id,
    required int animalId,
    required String name,
    required String latinName,
    required String animalType,
    required String activeTime,
    required String lengthMin,
    required String lengthMax,
    required String weightMin,
    required String weightMax,
    required String lifespan,
    required String habitat,
    required String diet,
    required String geoRange,
    required String imageLink,
  }) = _FirebaseAnimalsModel;

  factory FirebaseAnimalsModel.fromJson(Map<String, Object?> json) =>
      _$FirebaseAnimalsModelFromJson(json);
}


// class FirebaseAnimalsModel {
//   String name;
//   String latinName;
//   String animalType;
//   String activeTime;
//   String lengthMin;
//   String lengthMax;
//   String weightMin;
//   String weightMax;
//   String lifespan;
//   String habitat;
//   String diet;
//   String geoRange;
//   String imageLink;

//   FirebaseAnimalsModel(
//       {this.name,
//       this.latinName,
//       this.animalType,
//       this.activeTime,
//       this.lengthMin,
//       this.lengthMax,
//       this.weightMin,
//       this.weightMax,
//       this.lifespan,
//       this.habitat,
//       this.diet,
//       this.geoRange,
//       this.imageLink,});

//   FirebaseAnimalsModel.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     latinName = json['latin_name'];
//     animalType = json['animal_type'];
//     activeTime = json['active_time'];
//     lengthMin = json['length_min'];
//     lengthMax = json['length_max'];
//     weightMin = json['weight_min'];
//     weightMax = json['weight_max'];
//     lifespan = json['lifespan'];
//     habitat = json['habitat'];
//     diet = json['diet'];
//     geoRange = json['geo_range'];
//     imageLink = json['image_link'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['latin_name'] = this.latinName;
//     data['animal_type'] = this.animalType;
//     data['active_time'] = this.activeTime;
//     data['length_min'] = this.lengthMin;
//     data['length_max'] = this.lengthMax;
//     data['weight_min'] = this.weightMin;
//     data['weight_max'] = this.weightMax;
//     data['lifespan'] = this.lifespan;
//     data['habitat'] = this.habitat;
//     data['diet'] = this.diet;
//     data['geo_range'] = this.geoRange;
//     data['image_link'] = this.imageLink;
//     return data;
//   }
// }
