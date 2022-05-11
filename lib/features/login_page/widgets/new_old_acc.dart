import 'package:animals/features/login_page/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwapStateButton extends StatelessWidget {
  const SwapStateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return TextButton(
          style: TextButton.styleFrom(
            primary: Colors.purple,
          ),
          onPressed: () {
            context.read<LoginCubit>().createAccount(state.creatingAccount);
          },
          child: Text(state.creatingAccount == false
              ? 'Stwórz konto'
              : 'Posiadasz konto?'),
        );
      },
    );
  }
}
