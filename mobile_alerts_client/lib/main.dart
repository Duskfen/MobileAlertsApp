import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
//import 'package:mobile_alerts_client/Backgroundservice/callback_dispatcher.dart' as callback_dispatcher;
import 'package:mobile_alerts_client/Views/homepage/homepage.dart';
//import 'package:workmanager/workmanager.dart';

import 'Views/homepage/default_app_bar.dart';
import 'main.mapper.g.dart' show initializeJsonMapperAsync;

void main() async {
  // if (DeviceRepository.getAll().isEmpty) {
  //   Device d = await Device.createFetchDevice("020C28392184");
  //   DeviceRepository.save(d);
  // }
  await initializeJsonMapperAsync();
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
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return ValueListenableBuilder<ThemeMode>(
        valueListenable: MainApp.themeNotifier,
        builder: (context, themeMode, child) {
          return MaterialApp(
            theme: ThemeData.from(
                colorScheme: lightDynamic ??
                    ColorScheme.fromSeed(
                        seedColor: const Color.fromARGB(255, 52, 152, 219)),
                useMaterial3: true), //ThemeData.dark(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
                colorScheme: darkDynamic ??
                    ThemeData.dark(useMaterial3: true).colorScheme),
            themeMode: themeMode,
            home: Scaffold(
              appBar: AppBars.defaultAppBar(
                  context, themeMode, const Text("Overview")),
              body: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Center(child: Homepage()),
              ),
            ),
          );
        },
      );
    });
  }
}
