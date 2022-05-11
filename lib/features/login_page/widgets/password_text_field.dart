import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/colors.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: true,
        controller: passwordController,
        decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.vpn_key,
              color: AppColors.mainColor,
            ),
            labelText: 'Password',
            labelStyle: AppTypography.labelTextStyle,
            helperText: 'Min 5 znaków'),
        validator: (password) {
          if (password == null || password.isEmpty || password.length < 5) {
            return 'Wpisz poprawne hasło ';
          } else {
            return null;
          }
        });
  }
}
