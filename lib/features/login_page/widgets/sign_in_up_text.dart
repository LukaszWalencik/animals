import 'package:animals/features/login_page/cubit/login_cubit.dart';
import 'package:flutter/material.dart';

Text SignInUpText(LoginState state) {
  return Text(
    state.creatingAccount == false ? 'Zaloguj się' : 'Zarejestruj się',
    style: const TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    ),
  );
}
