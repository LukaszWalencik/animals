import 'package:animals/models/firebase_animals_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AnimalsFirebaseRepository {
  Stream<List<FirebaseAnimalsModel>> getAnimalsStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      null;
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('animals')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        print(doc.id);
        return FirebaseAnimalsModel(
          id: doc.id,
          animalId: doc['animal_id'],
          name: doc['name'],
          latinName: doc['latin_name'],
          animalType: doc['animal_type'],
          activeTime: doc['active_time'],
          lengthMin: doc['length_min'],
          lengthMax: doc['length_max'],
          weightMin: doc['weight_min'],
          weightMax: doc['weight_max'],
          lifespan: doc['lifespan'],
          habitat: doc['habitat'],
          diet: doc['diet'],
          geoRange: doc['geo_range'],
          imageLink: doc['image_link'],
        );
      }).toList();
    });
  }

  Future<void> remove({required String id}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      null;
    }
    FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('animals')
        .doc(id)
        .delete();
  }

  Future<void> add(
    int animalId,
    String name,
    String latinName,
    String animalType,
    String activeTime,
    String lengthMin,
    String lengthMax,
    String weightMin,
    String weightMax,
    String lifespan,
    String habitat,
    String diet,
    String geoRange,
    String imageLink,
  ) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Nie zalogowano');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('animals')
        .add(
      {
        'animal_id': animalId,
        'name': name,
        'latin_name': latinName,
        'animal_type': animalType,
        'active_time': activeTime,
        'length_min': lengthMin,
        'length_max': lengthMax,
        'weight_min': weightMin,
        'weight_max': weightMax,
        'lifespan': lifespan,
        'habitat': habitat,
        'diet': diet,
        'geo_range': geoRange,
        'image_link': imageLink,
      },
    );
  }
}
