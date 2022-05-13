import 'package:animals/model/animals_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesHive extends StatelessWidget {
  const FavoritesHive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animalBox = Hive.box('animalsbox');
    return ListView.builder(
        itemCount: animalBox.length,
        itemBuilder: (context, index) {
          final animals = animalBox.get(index);
          print(animals);
          return Container(
            child: Text(animals.toString()),
          );
        });
  }
}
