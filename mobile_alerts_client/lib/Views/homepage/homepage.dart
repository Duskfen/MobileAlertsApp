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

        rd.updateDeviceData();

        Timer.periodic(const Duration(seconds: 10), (timer) {
          rd.updateDeviceData();
        });
        return rd;
      },
      child: const DeviceList(),
    );
  }
}
