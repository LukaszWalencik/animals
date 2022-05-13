// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firebase_animals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FirebaseAnimalsModel _$$_FirebaseAnimalsModelFromJson(
        Map<String, dynamic> json) =>
    _$_FirebaseAnimalsModel(
      id: json['id'] as String,
      animalId: json['animal_id'] as int,
      name: json['name'] as String,
      latinName: json['latin_name'] as String,
      animalType: json['animal_type'] as String,
      activeTime: json['active_time'] as String,
      lengthMin: json['length_min'] as String,
      lengthMax: json['length_max'] as String,
      weightMin: json['weight_min'] as String,
      weightMax: json['weight_max'] as String,
      lifespan: json['lifespan'] as String,
      habitat: json['habitat'] as String,
      diet: json['diet'] as String,
      geoRange: json['geo_range'] as String,
      imageLink: json['image_link'] as String,
    );

Map<String, dynamic> _$$_FirebaseAnimalsModelToJson(
        _$_FirebaseAnimalsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'animal_id': instance.animalId,
      'name': instance.name,
      'latin_name': instance.latinName,
      'animal_type': instance.animalType,
      'active_time': instance.activeTime,
      'length_min': instance.lengthMin,
      'length_max': instance.lengthMax,
      'weight_min': instance.weightMin,
      'weight_max': instance.weightMax,
      'lifespan': instance.lifespan,
      'habitat': instance.habitat,
      'diet': instance.diet,
      'geo_range': instance.geoRange,
      'image_link': instance.imageLink,
    };
