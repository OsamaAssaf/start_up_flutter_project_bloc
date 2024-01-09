import '../../../resources/helpers/all_imports.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
      upgrader: Components().upgrader(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: const DrawerHome(),
      ),
    );
  }
}
