import 'package:animals/data/animals_data_sources.dart';
import 'package:animals/features/list_page/widgets/animal_card.dart';
import 'package:animals/features/list_page/cubit/animals_cubit.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/presentation/radius.dart';
import 'package:animals/repository/animals_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeListPage extends StatelessWidget {
  HomeListPage({
    Key? key,
  }) : super(key: key);
  final animalcontroller = TextEditingController();

  final animalBox = Hive.box('animalsbox');
  // final animal = animalBox.get(index) as AnimalModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimalsCubit(
        AnimalsRepository(
          AnimalsRemoteDataSource(
            Dio(),
          ),
        ),
      ),
      child: BlocConsumer<AnimalsCubit, AnimalsState>(
        listener: (context, state) {
          if (state is AnimalsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Sorry, something went wrong ='("),
                backgroundColor: AppColors.errorColor,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AnimalsLoading) {
            return animalsLoading();
          }
          if (state is AnimalsSuccess) {
            return animalList(context, state);
            // animalList(context, state);
          }

          return searchAnimals(context);
        },
      ),
    );
  }

  Scaffold animalsLoading() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Loading Knowledge!!',
              style: AppTypography.h2,
            ),
            SizedBox(height: AppDimens.l),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }

  Scaffold searchAnimals(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.s),
          child: ListView(
            children: [
              const Text('Write how many animals you want to search!'),
              TextField(
                maxLength: 1,
                controller: animalcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Write number between 1-9",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    final animalNumber = int.parse(animalcontroller.text);
                    if (animalNumber != 0) {
                      context
                          .read<AnimalsCubit>()
                          .getAnimalsModel(animalNumber);
                      context.read<AnimalsCubit>().saveAnimalData(animalNumber);
                      animalcontroller.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Value must be between 1-9'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.mainColor,
                  ),
                  child: const Text('Go!')),
            ],
          ),
        ),
      ),
    );
  }

  Scaffold animalList(BuildContext context, AnimalsSuccess state) {
    // final animal = animalBox.get(state) as AnimalsModel;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.s),
        child: ListView(
          children: [
            const Text('Write how many animals you want to search!'),
            TextField(
              maxLength: 1,
              controller: animalcontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Write number between 1-9",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  final animalNumber = int.parse(animalcontroller.text);
                  if (animalNumber != 0) {
                    context.read<AnimalsCubit>().getAnimalsModel(animalNumber);

                    context.read<AnimalsCubit>().saveAnimalData(animalNumber);
                    context
                        .read<AnimalsCubit>()
                        .saveDataFromMemory(animalNumber);
                    animalcontroller.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Value must be between 1-9'),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.mainColor,
                ),
                child: const Text('Go!')),
            for (final animal in state.animalsModel)
              Padding(
                padding: const EdgeInsets.only(bottom: AppRadius.s),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return animalCard(animal, context);
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.listElementBlack,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(AppRadius.ms)),
                      border: Border.all(
                        width: 3,
                        color: AppColors.black,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimens.s),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            animal.imageLink.toString(),
                            width: 150,
                            height: 150,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(AppDimens.s),
                              child: Column(
                                children: [
                                  const Text('Name:', style: AppTypography.h2),
                                  Text(animal.name.toString(),
                                      style: AppTypography.h2),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
