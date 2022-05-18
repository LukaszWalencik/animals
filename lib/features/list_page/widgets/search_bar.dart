import 'package:animals/features/list_page/cubit/animals_cubit.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/presentation/radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.animalcontroller,
  }) : super(key: key);

  final TextEditingController animalcontroller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dialogBlack,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 8, 0, 0),
        child: Row(
          children: [
            SizedBox(
              width: 280,
              height: 70,
              child: TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                ],
                controller: animalcontroller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Write number between 1-9",
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.mainColor),
                    borderRadius: BorderRadius.circular(AppRadius.xm),
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppDimens.ms),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: ElevatedButton(
                  onPressed: () {
                    final animalNumber = int.parse(animalcontroller.text);
                    if (animalNumber != 0) {
                      context
                          .read<AnimalsCubit>()
                          .getAnimalsModel(animalNumber);

                      // context
                      //     .read<AnimalsCubit>()
                      //     .saveAnimalData(animalNumber);
                      // context
                      //     .read<AnimalsCubit>()
                      //     .saveDataFromMemory(animalNumber);
                      // animalcontroller.clear();
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
            ),
          ],
        ),
      ),
    );
  }
}
