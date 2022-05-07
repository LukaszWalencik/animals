import 'package:animals/features/login_page/cubit/login_cubit.dart';
import 'package:animals/features/login_page/widgets/new_old_acc.dart';
import 'package:animals/features/login_page/widgets/sign_in_up_text.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.purple,
              title: const Text('Animals App!', style: AppTypography.h2),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(AppDimens.xm),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignInUpText(state),
                    const SizedBox(
                      height: AppDimens.xxxl,
                    ),
                    emailTextField(),
                    const SizedBox(
                      height: AppDimens.m,
                    ),
                    passwordTextField(),
                    const SizedBox(
                      height: AppDimens.ms,
                    ),
                    Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(
                      height: AppDimens.ms,
                    ),
                    signInUpButton(state, context),
                    const SizedBox(
                      height: AppDimens.ms,
                    ),
                    NewOldAcc(context, state)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  TextField emailTextField() {
    return TextField(
      controller: emailController,
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: AppColors.mainColor,
        ),
        hintText: 'Email',
      ),
    );
  }

  TextField passwordTextField() {
    return TextField(
      obscureText: true,
      controller: passwordController,
      decoration: const InputDecoration(
        prefixIcon: Icon(
          Icons.vpn_key,
          color: AppColors.mainColor,
        ),
        hintText: 'Password',
      ),
    );
  }

  ElevatedButton signInUpButton(LoginState state, BuildContext context) {
    return ElevatedButton(
        onPressed: state.creatingAccount
            ? () {
                context
                    .read<LoginCubit>()
                    .signUp(emailController.text, passwordController.text);
              }
            : () {
                context
                    .read<LoginCubit>()
                    .singIn(emailController.text, passwordController.text);
              },
        child: Text(
          state.creatingAccount == false ? 'Zaloguj' : 'Rejestracja',
        ),
        style: ElevatedButton.styleFrom(primary: AppColors.mainColor));
  }
}
