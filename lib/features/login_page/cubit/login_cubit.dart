import 'package:animals/core/enums.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void createAccount(bool creatingAccount) {
    switch (creatingAccount) {
      case false:
        emit(
          const LoginState(creatingAccount: true),
        );
        break;
      case true:
        emit(
          const LoginState(creatingAccount: false),
        );
        break;
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(
        const LoginState(status: Status.loading),
      );
    } catch (error) {
      emit(
        const LoginState(status: Status.error, errorMessage: 'Sign up Error'),
      );
    }
  }

  Future<void> singIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(
        const LoginState(status: Status.loading),
      );
    } catch (error) {
      emit(
        const LoginState(status: Status.error, errorMessage: 'Sign in Error'),
      );
    }
  }
}
