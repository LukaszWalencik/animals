import 'package:animals/authentication/cubit/authentication_cubit.dart';
import 'package:animals/data/animals_data_sources.dart';
import 'package:animals/features/account_page/account_page.dart';
import 'package:animals/features/list_page/cubit/animals_cubit.dart';
import 'package:animals/features/login_page/login_page.dart';
import 'package:animals/repository/animals_repository.dart';
import 'package:animals/repository/favorite_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationCubit()..authentication(),
      child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          final user = state.user;
          final form = GlobalKey<FormState>();

          if (user == null) {
            return Form(
              key: form,
              child: LoginPage(form: form),
            );
          }
          return BlocProvider(
            create: (context) => AnimalsCubit(
                AnimalsRepository(AnimalsRemoteDataSource(Dio())),
                AnimalsFirebaseRepository()),
            child: const AccountPage(),
          );
        },
      ),
    );
  }
}
