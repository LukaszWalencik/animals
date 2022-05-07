part of 'authentication_cubit.dart';

@immutable
class AuthenticationState {
  const AuthenticationState(
      {required this.user,
      required this.isLoading,
      required this.errorMessage});

  final User? user;
  final bool isLoading;
  final String errorMessage;
}
