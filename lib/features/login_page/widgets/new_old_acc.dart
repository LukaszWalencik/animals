import 'package:animals/features/login_page/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextButton NewOldAcc(BuildContext context, LoginState state) {
  return TextButton(
    style: TextButton.styleFrom(
      primary: Colors.purple,
    ),
    onPressed: () {
      context.read<LoginCubit>().createAccount(state.creatingAccount);
    },
    child: Text(
        state.creatingAccount == false ? 'Stwórz konto' : 'Posiadasz konto?'),
  );
}
