import 'package:flutter/material.dart';
import 'package:mobile_alerts_client/Views/deviceDetails/chart_page/chart_page.dart';
import 'package:mobile_alerts_client/Views/homepage/device_card.dart';

import '../../Model/device/device.dart';
import '../../main.dart';
import '../homepage/default_app_bar.dart';
import 'measurement_list.dart';

class DeviceDetails extends StatelessWidget {
  const DeviceDetails({
    super.key,
    required this.device,
    required this.removeDevice,
  });

  // final Function(Device d) onChangeDevice;
  final Function(Device device) removeDevice;
  final Device device;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: MainApp.themeNotifier,
        builder: (context, themeMode, child) {
          return Scaffold(
            appBar:
                AppBars.defaultAppBar(context, themeMode, const Text("Device")),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Hero(
                      tag: "hero_device_${device.id}",
                      child: DeviceCard(
                        removeDevice: removeDevice,
                        device: device,
                      ),
                    ),
                    Expanded(
                      child: DefaultTabController(
                        length: 2,
                        child: Scaffold(
                          bottomNavigationBar: const TabBar(
                            tabs: [
                              Tab(
                                icon: Icon(Icons.list),
                              ),
                              Tab(
                                icon: Icon(Icons.bar_chart),
                              ),
                            ],
                          ),
                          body: TabBarView(children: [
                            // MeasurementList(device: device),
                            MeasurementList(
                              device: device,
                            ),
                            ChartPage(device: device),
                          ]),
                        ),
                      ),
                    )
                  ],
                )),
          );
        });
  }
}
