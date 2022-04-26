class AnimalModel {
  AnimalModel({
    required this.name,
    required this.latinName,
    required this.animalType,
    required this.activeTime,
    required this.lengthMin,
    required this.lengthMax,
    required this.weightMin,
    required this.weightMax,
    required this.lifespan,
    required this.habitat,
    required this.diet,
    required this.geoRange,
    required this.imageLink,
    required this.id,
  });
  late final String name;
  late final String latinName;
  late final String animalType;
  late final String activeTime;
  late final String lengthMin;
  late final String lengthMax;
  late final String weightMin;
  late final String weightMax;
  late final String lifespan;
  late final String habitat;
  late final String diet;
  late final String geoRange;
  late final String imageLink;
  late final int id;

  AnimalModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    latinName = json['latin_name'];
    animalType = json['animal_type'];
    activeTime = json['active_time'];
    lengthMin = json['length_min'];
    lengthMax = json['length_max'];
    weightMin = json['weight_min'];
    weightMax = json['weight_max'];
    lifespan = json['lifespan'];
    habitat = json['habitat'];
    diet = json['diet'];
    geoRange = json['geo_range'];
    imageLink = json['image_link'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['latin_name'] = latinName;
    _data['animal_type'] = animalType;
    _data['active_time'] = activeTime;
    _data['length_min'] = lengthMin;
    _data['length_max'] = lengthMax;
    _data['weight_min'] = weightMin;
    _data['weight_max'] = weightMax;
    _data['lifespan'] = lifespan;
    _data['habitat'] = habitat;
    _data['diet'] = diet;
    _data['geo_range'] = geoRange;
    _data['image_link'] = imageLink;
    _data['id'] = id;
    return _data;
  }
}
