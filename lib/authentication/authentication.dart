import 'package:animals/authentication/cubit/authentication_cubit.dart';
import 'package:animals/features/account_page/account_page.dart';
import 'package:animals/features/login_page/login_page.dart';
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

          if (user == null) {
            return const LoginPage();
          }
          return const AccountPage();
        },
      ),
    );
  }
}
