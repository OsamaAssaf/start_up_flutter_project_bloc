import '../../../resources/helpers/all_imports.dart';

part 'connection_error_state.dart';

class ConnectionErrorCubit extends Cubit<ConnectionErrorState> {
  ConnectionErrorCubit() : super(ConnectionErrorInitial());

  Future<void> checkConnection() async {
    Components().showLoading();
    final bool result = await Components().checkConnection();
    await Future.delayed(const Duration(milliseconds: 300));
    Components().dismissLoading();
    if (result == true) {
      navigatorKey.currentState!.pushReplacementNamed(Routes.splashRoute);
    }
  }
}
