import 'package:flutter/material.dart';

import '../../main.dart';

class AppBars {
  static AppBar defaultAppBar(
      BuildContext context, ThemeMode themeMode, Widget title) {
    return AppBar(
      title: title,
      shadowColor: Theme.of(context).colorScheme.shadow,
      actions: [
        IconButton(
            onPressed: () => MainApp.themeNotifier.value =
                themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
            icon: Icon(themeMode == ThemeMode.light
                ? Icons.dark_mode
                : Icons.light_mode)),
      ],
    );
  }
}
