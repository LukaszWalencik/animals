import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit()
      : super(const AuthenticationState(
            user: null, isLoading: false, errorMessage: ''));

  StreamSubscription? _streamSubscription;

  Future<void> authentication() async {
    emit(
      const AuthenticationState(user: null, isLoading: true, errorMessage: ''),
    );

    _streamSubscription = FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        emit(
          AuthenticationState(user: user, isLoading: false, errorMessage: ''),
        );
      },
    )..onError(
        (error) {
          emit(
            AuthenticationState(
              user: null,
              isLoading: false,
              errorMessage: error.toString(),
            ),
          );
        },
      );
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
