import '../../../resources/helpers/all_imports.dart';

class ConnectionErrorView extends StatefulWidget {
  const ConnectionErrorView({super.key});

  @override
  State<ConnectionErrorView> createState() => _ConnectionErrorViewState();
}

class _ConnectionErrorViewState extends State<ConnectionErrorView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final double width = MediaQuery.sizeOf(context).width;
      showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return PopScope(
            canPop: false,
            child: SizedBox(
              height: 280.0,
              width: width,
              child: Container(
                height: 280.0,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.background,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(36.0),
                    topRight: Radius.circular(36.0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: (width * 0.70) - 16.0,
                          child: Column(
                            children: [
                              Text(
                                localizations.connectionFailedConnectServer,
                                softWrap: true,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: customTheme.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                localizations.pleaseCheckYourConnectionTryAgain,
                                softWrap: true,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: customTheme.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        SvgPicture.asset(
                          ImagesManager.connectionErrorSvg,
                          width: (width * 0.30) - 24.0,
                        ),
                        const SizedBox(width: 8.0),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    MainButton(
                      title: localizations.retry,
                      onPressed: BlocProvider.of<ConnectionErrorCubit>(context).checkConnection,
                    ),
                    const SizedBox(height: 4.0),
                    MainButton(
                      title: localizations.close,
                      color: theme.colorScheme.primary,
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      backgroundColor: customTheme.white,
                      borderSide: BorderSide(
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        enableDrag: false,
        isDismissible: false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: localizations.connectionError,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            localizations.yourDeviceNotConnectedInternet,
            style: TextStyle(
              color: customTheme.black,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
