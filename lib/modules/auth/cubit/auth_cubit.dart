import '../../../resources/helpers/all_imports.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());
  final AuthRepository authRepository;
  AuthType authType = AuthType.login;
  void changeAuthType() {
    authType = authType == AuthType.login ? AuthType.signUp : AuthType.login;
    emit(AuthInitial(
      authType: authType,
    ));
  }

  Future<void> submit() async {
    navigatorKey.currentState!.pushReplacementNamed(Routes.homeRoute);
  }
}
