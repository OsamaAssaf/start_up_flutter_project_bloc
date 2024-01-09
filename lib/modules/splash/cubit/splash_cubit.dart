import '../../../resources/helpers/all_imports.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> checkConnection() async {
    final bool result = await Components().checkConnection();
    if (result == true) {
      navigatorKey.currentState!.pushReplacementNamed(Routes.authRoute);
    } else {
      navigatorKey.currentState!.pushReplacementNamed(Routes.connectionErrorRoute);
    }
  }
}
