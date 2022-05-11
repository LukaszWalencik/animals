import 'package:animals/features/login_page/cubit/login_cubit.dart';
import 'package:animals/features/login_page/widgets/email_text_field.dart';
import 'package:animals/features/login_page/widgets/new_old_acc.dart';
import 'package:animals/features/login_page/widgets/password_text_field.dart';
import 'package:animals/features/login_page/widgets/sign_in-up_button.dart';
import 'package:animals/features/login_page/widgets/sign_in_up_text.dart';
import 'package:animals/presentation/app_typography.dart';
import 'package:animals/presentation/colors.dart';
import 'package:animals/presentation/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
    required this.form,
  }) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        title: const Text('Animals App!', style: AppTypography.h2),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.xm),
          child: BlocProvider(
            create: (context) => LoginCubit(),
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInUpText(state),
                      const SizedBox(
                        height: AppDimens.xxxl,
                      ),
                      EmailTextField(emailController: emailController),
                      const SizedBox(
                        height: AppDimens.m,
                      ),
                      PasswordTextField(passwordController: passwordController),
                      const SizedBox(
                        height: AppDimens.ms,
                      ),
                      SignInUpButton(
                          form: form,
                          emailController: emailController,
                          passwordController: passwordController),
                      const SizedBox(
                        height: AppDimens.ms,
                      ),
                      const SwapStateButton()
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
