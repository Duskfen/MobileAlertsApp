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

        rd.updateDeviceData();

        Timer.periodic(const Duration(seconds: 10), (timer) {
          rd.updateDeviceData(); //device will check for itself if its really ready to update
        });
        return rd;
      },
      child: const DeviceList(),
    );
  }
}
