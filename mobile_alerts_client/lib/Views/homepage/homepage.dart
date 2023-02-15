import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Model/device/registered_devices.dart';
import 'package:provider/provider.dart';

import 'device_list.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final rd = RegisteredDevices();
        //If the last poll is older then 15min
        if ((rd.lastpoll?.difference(DateTime.now()).abs() ??
                const Duration(minutes: 16)) >
            const Duration(minutes: 15)) {
          rd.updateDeviceData();
        }
        Timer.periodic(const Duration(seconds: 10), (timer) {
          //maybe lober interval but listen to is window active //maybe https://api.flutter.dev/flutter/widgets/WidgetsBindingObserver-class.html
          //TODO move todos to github issues
          //because it does not work in background
          if ((rd.lastpoll?.difference(DateTime.now()).abs() ??
                  const Duration(minutes: 16)) >
              const Duration(minutes: 15)) {
            rd.updateDeviceData();
          }
        });
        return rd;
      },
      child: const DeviceList(),
    );
  }
}
