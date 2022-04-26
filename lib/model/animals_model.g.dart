// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnimalsModel _$$_AnimalsModelFromJson(Map<String, dynamic> json) =>
    _$_AnimalsModel(
      name: json['name'] as String?,
      latinName: json['latinName'] as String?,
      animalType: json['animalType'] as String?,
      activeTime: json['activeTime'] as String?,
      lengthMin: json['lengthMin'] as String?,
      lengthMax: json['lengthMax'] as String?,
      weightMin: json['weightMin'] as String?,
      weightMax: json['weightMax'] as String?,
      lifespan: json['lifespan'] as String?,
      habitat: json['habitat'] as String?,
      diet: json['diet'] as String?,
      geoRange: json['geoRange'] as String?,
      imageLink: json['imageLink'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$_AnimalsModelToJson(_$_AnimalsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latinName': instance.latinName,
      'animalType': instance.animalType,
      'activeTime': instance.activeTime,
      'lengthMin': instance.lengthMin,
      'lengthMax': instance.lengthMax,
      'weightMin': instance.weightMin,
      'weightMax': instance.weightMax,
      'lifespan': instance.lifespan,
      'habitat': instance.habitat,
      'diet': instance.diet,
      'geoRange': instance.geoRange,
      'imageLink': instance.imageLink,
      'id': instance.id,
    };
