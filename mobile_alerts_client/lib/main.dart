import 'package:flutter/material.dart';
//import 'package:mobile_alerts_client/Backgroundservice/callback_dispatcher.dart' as callback_dispatcher;
import 'package:mobile_alerts_client/Views/homepage/homepage.dart';
//import 'package:workmanager/workmanager.dart';

void main() async {
  // if (DeviceRepository.getAll().isEmpty) {
  //   Device d = await Device.createFetchDevice("020C28392184");
  //   DeviceRepository.save(d);
  // }

  runApp(const MainApp());

  //Workmanager doesn't run on background.
  // Workmanager().initialize(
  //   //allbackDispatcher.callbackDispatcher,
  //   callback_dispatcher.callbackDispatcher,
  //   isInDebugMode: true,
  // );
  // Workmanager().registerPeriodicTask(
  //   callback_dispatcher.periodicPollDevices,
  //   callback_dispatcher.periodicPollDevices,
  //   frequency: const Duration(minutes: 15),
  //   constraints: Constraints(networkType: NetworkType.not_roaming),
  // );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.system);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: MainApp.themeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp(
          theme: ThemeData.from(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: const Color.fromARGB(255, 52, 152, 219)),
              useMaterial3: true), //ThemeData.dark(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: themeMode,
          home: Scaffold(
            appBar: myAppBar(context, themeMode),
            body: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: Homepage()),
            ),
          ),
        );
      },
    );
  }

  AppBar myAppBar(BuildContext context, ThemeMode themeMode) {
    return AppBar(
      title: const Text("Overview"),
      shadowColor: Theme.of(context).colorScheme.shadow,
      actions: [
        IconButton(
            onPressed: () => MainApp.themeNotifier.value =
                themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
            icon: Icon(themeMode == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode)),
        IconButton(
            onPressed: () => throw UnimplementedError(),
            icon: const Icon(Icons.more_vert))
      ],
    );
  }
}
