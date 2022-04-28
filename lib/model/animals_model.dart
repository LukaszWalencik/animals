// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'animals_model.freezed.dart';
part 'animals_model.g.dart';

@freezed
class AnimalsModel with _$AnimalsModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AnimalsModel({
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
    required int id,
  }) = _AnimalsModel;

  factory AnimalsModel.fromJson(Map<String, Object?> json) =>
      _$AnimalsModelFromJson(json);
}
