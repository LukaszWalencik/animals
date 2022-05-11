// import 'package:animals/features/list_page/cubit/animals_cubit.dart';
// import 'package:animals/features/list_page/widgets/animal_card.dart';
// import 'package:animals/presentation/app_typography.dart';
// import 'package:animals/presentation/colors.dart';
// import 'package:animals/presentation/dimens.dart';
// import 'package:animals/presentation/radius.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class AnimalsSuccessScreen extends StatelessWidget {
//   AnimalsSuccessScreen({Key? key}) : super(key: key);
//   final animalcontroller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AnimalsCubit, AnimalsState>(
//       builder: (context, state) {
//         return Padding(
//           padding: const EdgeInsets.all(AppDimens.s),
//           child: ListView(
//             children: [
//               const Text('Write how many animals you want to search!'),
//               TextField(
//                 maxLength: 1,
//                 controller: animalcontroller,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   hintText: "Write number between 1-9",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                 ),
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     final animalNumber = int.parse(animalcontroller.text);
//                     if (animalNumber != 0) {
//                       context
//                           .read<AnimalsCubit>()
//                           .getAnimalsModel(animalNumber);

//                       context.read<AnimalsCubit>().saveAnimalData(animalNumber);
//                       context
//                           .read<AnimalsCubit>()
//                           .saveDataFromMemory(animalNumber);
//                       animalcontroller.clear();
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text('Value must be between 1-9'),
//                         ),
//                       );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     primary: AppColors.mainColor,
//                   ),
//                   child: const Text('Go!')),
//               for (final animal in state.animalsModel)
//                 Padding(
//                   padding: const EdgeInsets.only(bottom: AppRadius.s),
//                   child: GestureDetector(
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           return animalCard(animal, context);
//                         },
//                       );
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: AppColors.listElementBlack,
//                         borderRadius: const BorderRadius.all(
//                             Radius.circular(AppRadius.ms)),
//                         border: Border.all(
//                           width: 3,
//                           color: AppColors.black,
//                           style: BorderStyle.solid,
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(AppDimens.s),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             Image.network(
//                               animal.imageLink.toString(),
//                               width: 150,
//                               height: 150,
//                             ),
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(AppDimens.s),
//                                 child: Column(
//                                   children: [
//                                     const Text('Name:',
//                                         style: AppTypography.h2),
//                                     Text(animal.name.toString(),
//                                         style: AppTypography.h2),
//                                   ],
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
