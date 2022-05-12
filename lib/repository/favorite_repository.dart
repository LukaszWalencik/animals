import 'package:animals/model/animals_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AnimalsFirebaseRepository {
  Stream<List<AnimalsModel>> getAnimalsStream() {
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
        return AnimalsModel(
            name: doc['name'],
            latinName: doc['latinName'],
            animalType: doc['animalType'],
            activeTime: doc['activeTime'],
            lengthMin: doc['lengthMin'],
            lengthMax: doc['vlengthMax'],
            weightMin: doc['weightMin'],
            weightMax: doc['weightMax'],
            lifespan: doc['lifespan'],
            habitat: doc['habitat'],
            diet: doc['diet'],
            geoRange: doc['geoRange'],
            imageLink: doc['imageLink'],
            id: int.parse(doc.id));
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
    int id,
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
        'name': name,
        'latinName': latinName,
        'animalType': animalType,
        'activeTime': activeTime,
        'lengthMin': lengthMin,
        'vlengthMax': lengthMax,
        'weightMin': weightMin,
        'weightMax': weightMax,
        'lifespan': lifespan,
        'habitat': habitat,
        'diet': diet,
        'geoRange': geoRange,
        'imageLink': imageLink,
        'id': id
      },
    );
  }
}
