import 'package:animals/firebase_options.dart';
import 'package:animals/models/animals_model.dart';
import 'package:animals/my_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDirectory.path);
  Hive.registerAdapter(AnimalsModelAdapter());
  await Hive.openBox('animalsbox');
  runApp(const MyApp());
}
