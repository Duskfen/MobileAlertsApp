import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Model/device/RegisteredDevices.dart';
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
        if ((rd.lastpoll?.difference(DateTime.now()).abs() ?? Duration.zero) >
            const Duration(minutes: 15)) {
          rd.updateDeviceData();
        }
        Timer.periodic(const Duration(seconds: 10), (timer) {
          //maybe lober interval but listen to is window active
          //because it does not work in background
          if ((rd.lastpoll?.difference(DateTime.now()).abs() ?? Duration.zero) >
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