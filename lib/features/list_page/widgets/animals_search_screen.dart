import 'package:animals/features/list_page/cubit/animals_cubit.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimalSearchScreen extends StatelessWidget {
  const AnimalSearchScreen({
    Key? key,
    required this.animalcontroller,
  }) : super(key: key);

  final TextEditingController animalcontroller;

  @override
  Widget build(BuildContext context) {
    return Center(
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  final animalNumber = int.parse(animalcontroller.text);
                  if (animalNumber != 0) {
                    context.read<AnimalsCubit>().getAnimalsModel(animalNumber);
                    // context.read<AnimalsCubit>().saveAnimalData(animalNumber);
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
    );
  }
}
