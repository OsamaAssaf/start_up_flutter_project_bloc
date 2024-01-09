import '../helpers/all_imports.dart';

class Routes {
  static const String unDefinedRoute = '/NotFoundView';
  static const String splashRoute = '/SplashView';
  static const String authRoute = '/AuthView';
  static const String homeRoute = '/HomeView';
  static const String connectionErrorRoute = '/ConnectionErrorView';
  static const String settingsRoute = '/SettingsView';
}

class RouteGenerator {
  static Route getPages(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => SplashCubit(),
            child: const SplashView(),
          ),
        );
      case Routes.authRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(
              authRepository: AuthApi(),
            ),
            child: const AuthView(),
          ),
        );
      case Routes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => HomeCubit(),
            child: const HomeView(),
          ),
        );
      case Routes.connectionErrorRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => ConnectionErrorCubit(),
            child: const ConnectionErrorView(),
          ),
        );
      case Routes.settingsRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => SettingsCubit(),
            child: const SettingsView(),
          ),
        );
      default:
        return unDefinedRoute();
    }
  }

  static MaterialPageRoute unDefinedRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(localizations.noRouteFound),
        ),
        body: Center(
          child: Text(localizations.noRouteFound),
        ),
      );
    });
  }
}
