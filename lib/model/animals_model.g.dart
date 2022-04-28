// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animals_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AnimalsModelAdapter extends TypeAdapter<AnimalsModel> {
  @override
  final int typeId = 0;

  @override
  AnimalsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AnimalsModel(
      name: fields[0] as String,
      latinName: fields[1] as String,
      animalType: fields[2] as String,
      activeTime: fields[3] as String,
      lengthMin: fields[4] as String,
      lengthMax: fields[5] as String,
      weightMin: fields[6] as String,
      weightMax: fields[7] as String,
      lifespan: fields[8] as String,
      habitat: fields[9] as String,
      diet: fields[10] as String,
      geoRange: fields[11] as String,
      imageLink: fields[12] as String,
      id: fields[13] as int,
    );
  }

  @override
  void write(BinaryWriter writer, AnimalsModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.latinName)
      ..writeByte(2)
      ..write(obj.animalType)
      ..writeByte(3)
      ..write(obj.activeTime)
      ..writeByte(4)
      ..write(obj.lengthMin)
      ..writeByte(5)
      ..write(obj.lengthMax)
      ..writeByte(6)
      ..write(obj.weightMin)
      ..writeByte(7)
      ..write(obj.weightMax)
      ..writeByte(8)
      ..write(obj.lifespan)
      ..writeByte(9)
      ..write(obj.habitat)
      ..writeByte(10)
      ..write(obj.diet)
      ..writeByte(11)
      ..write(obj.geoRange)
      ..writeByte(12)
      ..write(obj.imageLink)
      ..writeByte(13)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AnimalsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AnimalsModel _$$_AnimalsModelFromJson(Map<String, dynamic> json) =>
    _$_AnimalsModel(
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
      id: json['id'] as int,
    );

Map<String, dynamic> _$$_AnimalsModelToJson(_$_AnimalsModel instance) =>
    <String, dynamic>{
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
      'id': instance.id,
    };
