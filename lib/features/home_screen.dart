import 'package:animals/data/animals_data_sources.dart';
import 'package:animals/features/cubit/animals_cubit.dart';
import 'package:animals/repository/animals_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AnimalsCubit(AnimalsRepository(AnimalsRemoteDataSource(Dio())))
            ..getAnimalsModel(),
      child: BlocBuilder<AnimalsCubit, AnimalsState>(
        builder: (context, state) {
          return Scaffold(
            body: ListView(
              children: [
                for (final animal in state.animalsModel)
                  Row(
                    children: [Container(), Text(animal.name.toString())],
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
