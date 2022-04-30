import 'package:animals/core/enums.dart';
import 'package:animals/data/animals_data_sources.dart';
import 'package:animals/features/list_page.dart/cubit/animals_cubit.dart';
import 'package:animals/features/list_page.dart/widgets/animal_card.dart';
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
  final _formKey = GlobalKey<FormState>();

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
          if (state.status == Status.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Sorry, something went wrong ='("),
                backgroundColor: AppColors.errorColor,
              ),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.mainColor,
                centerTitle: true,
                title: const Text(
                  'Read something about animals!',
                  style: AppTypography.h2,
                ),
              ),
              body: Center(
                child: Builder(
                  builder: (context) {
                    if (state.status == Status.loading) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Loading Knowledge!!',
                            style: AppTypography.h2,
                          ),
                          SizedBox(height: AppDimens.l),
                          CircularProgressIndicator(),
                        ],
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(AppDimens.s),
                      child: Expanded(
                        child: ListView(
                          children: [
                            Text('Write how many animals you want to search!'),
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
                                  final animalNumber =
                                      int.parse(animalcontroller.text);
                                  if (animalNumber != 0) {
                                    context
                                        .read<AnimalsCubit>()
                                        .getAnimalsModel(animalNumber);
                                    animalcontroller.clear();
                                  } else
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Value must be between 1-9'),
                                      ),
                                    );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: AppColors.mainColor,
                                ),
                                child: Text('Go!')),
                            for (final animals in state.animalsModel)

                              //  AnimalCard(animalModel)
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: AppRadius.s),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return animalCard(animals, context);
                                      },
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.listElementBlack,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(AppRadius.ms)),
                                      border: Border.all(
                                        width: 3,
                                        color: AppColors.black,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.all(AppDimens.s),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.network(
                                            animals.imageLink.toString(),
                                            width: 150,
                                            height: 150,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  AppDimens.s),
                                              child: Column(
                                                children: [
                                                  const Text('Name:',
                                                      style: AppTypography.h2),
                                                  Text(animals.name.toString(),
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
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
