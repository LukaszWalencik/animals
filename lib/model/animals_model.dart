// This file is "main.dart"
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'animals_model.freezed.dart';
part 'animals_model.g.dart';

@freezed
@HiveType(typeId: 0)
class AnimalsModel with _$AnimalsModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory AnimalsModel({
    @HiveField(0) required String name,
    @HiveField(1) required String latinName,
    @HiveField(2) required String animalType,
    @HiveField(3) required String activeTime,
    @HiveField(4) required String lengthMin,
    @HiveField(5) required String lengthMax,
    @HiveField(6) required String weightMin,
    @HiveField(7) required String weightMax,
    @HiveField(8) required String lifespan,
    @HiveField(9) required String habitat,
    @HiveField(10) required String diet,
    @HiveField(11) required String geoRange,
    @HiveField(12) required String imageLink,
    @HiveField(13) required int id,
  }) = _AnimalsModel;

  factory AnimalsModel.fromJson(Map<String, Object?> json) =>
      _$AnimalsModelFromJson(json);
}
