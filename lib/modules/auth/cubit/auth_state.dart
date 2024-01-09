part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {
  final AuthType authType;

  AuthInitial({
    this.authType = AuthType.login,
  });
}
