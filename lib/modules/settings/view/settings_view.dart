import '../../../resources/helpers/all_imports.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: localizations.settings,
      ),
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: const [],
      ),
    );
  }
}
