import 'package:animals/features/login_page/cubit/login_cubit.dart';
import 'package:animals/presentation/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInUpButton extends StatelessWidget {
  const SignInUpButton({
    Key? key,
    required this.form,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final GlobalKey<FormState> form;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.creatingAccount
              ? () {
                  final isValidate = form.currentState!.validate();
                  if (!isValidate) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Należy wypełnić poprawnie wszystkie pola'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    context.read<LoginCubit>().signUp(
                          emailController.text,
                          passwordController.text,
                        );
                  }
                }
              : () {
                  final isValidate = form.currentState!.validate();
                  if (!isValidate) {
                    FocusManager.instance.primaryFocus?.unfocus();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content:
                            Text('Należy wypełnić poprawnie wszystkie pola'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  } else {
                    context.read<LoginCubit>().singIn(
                          emailController.text,
                          passwordController.text,
                        );
                  }
                },
          child: Text(
            state.creatingAccount == false ? 'Zaloguj' : 'Rejestracja',
          ),
          style: ElevatedButton.styleFrom(primary: AppColors.mainColor),
        );
      },
    );
  }
}
