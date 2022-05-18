import 'package:animals/features/list_page/widgets/animal_card.dart';
import 'package:animals/features/list_page/widgets/animal_details_card.dart';
import 'package:animals/features/list_page/cubit/animals_cubit.dart';
import 'package:animals/features/list_page/widgets/animals_loading_screen.dart';
import 'package:animals/features/list_page/widgets/animals_search_screen.dart';
import 'package:animals/features/list_page/widgets/animal_card_widgets/favorite_button.dart';
import 'package:animals/features/list_page/widgets/search_bar.dart';
import 'package:animals/features/list_page/widgets/animal_card_widgets/star_button.dart';
import 'package:animals/models/animals_model.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:animals/presentation/radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeListPage extends StatelessWidget {
  HomeListPage({
    Key? key,
  }) : super(key: key);
  final animalcontroller = TextEditingController();

  final animalBox = Hive.box('animalsbox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AnimalsCubit, AnimalsState>(
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
            return const AnimalsLoadingScreen();
          }
          if (state is AnimalsSuccess) {
            return animalSuccessScreen(context, state);
          }

          return AnimalSearchScreen(animalcontroller: animalcontroller);
        },
      ),
    );
  }

  Column animalSuccessScreen(BuildContext context, AnimalsSuccess state) {
    final animalModel = state.animalsModel;
    return Column(
      children: [
        Expanded(
          child: Padding(
              padding: const EdgeInsets.all(AppDimens.s),
              child: ListView.builder(
                itemCount: animalModel.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return animalDetailsCard(animalModel[index], context);
                        },
                      );
                    },
                    child: AnimalsCard(
                      animalModel: animalModel,
                      animalBox: animalBox,
                      index: index,
                    ),
                  );
                },
              )),
        ),
        SearchBar(animalcontroller: animalcontroller),
      ],
    );
  }
}
