import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
    required this.emailController,
  }) : super(key: key);

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: const InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: AppColors.mainColor,
          ),
          labelText: 'Email np email@example.com',
          labelStyle: AppTypography.labelTextStyle),
      validator: (email) {
        if (email == null) {
          return 'Wpisz e-mail';
        }
        if (!EmailValidator.validate(email)) {
          return 'Wpisz poprawny e-mail';
        } else {
          return null;
        }
      },
    );
  }
}
