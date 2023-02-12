import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:mobile_alerts_client/Backgroundservice/callback_dispatcher.dart';
import 'package:mobile_alerts_client/Backgroundservice/poll_devices.dart';
import 'package:mobile_alerts_client/Domain/device_repository.dart';
import 'package:mobile_alerts_client/Views/homepage.dart';
import 'package:workmanager/workmanager.dart';

import 'Model/device/device.dart';
import 'Model/device/measurements/measurementid02.dart';

void main() async {
  if (DeviceRepository.getAllDevices().isEmpty) {
    Device d = await Device.createDevice("020C28392184");
    DeviceRepository.saveDevice(d);
  }

  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(
    CallbackDispatcher.callbackDispatcher,
    isInDebugMode: true,
  );
  Workmanager().registerPeriodicTask(
    CallbackDispatcher.periodicPollDevices,
    CallbackDispatcher.periodicPollDevices,
    frequency: const Duration(minutes: 15),
    constraints: Constraints(networkType: NetworkType.not_roaming),
  );

  // await PollDevices.pollAllAvailableDevices();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.system);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, themeMode, child) {
        return MaterialApp(
            theme: ThemeData.light(useMaterial3: true),
            darkTheme: ThemeData.dark(useMaterial3: true),
            themeMode: themeMode,
            home: child);
      },
      child: Scaffold(
        appBar: myAppBar(context),
        body: const Center(child: Homepage()),
      ),
    );
  }

  AppBar myAppBar(BuildContext context) {
    return AppBar(
      title: const Text("Overview"),
      shadowColor: Theme.of(context).colorScheme.shadow,
      actions: [
        IconButton(
            onPressed: () => throw UnimplementedError(),
            icon: const Icon(Icons.more_vert))
      ],
    );
  }
}
