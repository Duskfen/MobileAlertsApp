import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Views/homepage.dart';

//TODO https://isar.dev/tutorials/quickstart.html

void main() {
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
