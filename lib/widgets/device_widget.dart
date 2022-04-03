import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:homer/pages/device_info_page.dart';
import 'package:homer/utils/alert_util.dart';
import 'package:homer/utils/color_util.dart';

class DeviceWidget extends StatefulWidget {
  DeviceWidget({Key? key, required this.result}) : super(key: key) {
    device = result.device;
  }

  final ScanResult result;
  late BluetoothDevice device;

  @override
  _DeviceWidgetState createState() => _DeviceWidgetState();
}

class _DeviceWidgetState extends State<DeviceWidget> {
  BluetoothDeviceState lastState = BluetoothDeviceState.disconnected;
  @override
  void initState() {
    super.initState();
  }

  tryConnect() async {
    if (widget.result.advertisementData.connectable) {
      lastState = await widget.device.state.first;
      if (lastState.name == "disconnected") {
        try {
          widget.device.connect(
              timeout: const Duration(seconds: 10), autoConnect: false);
        } catch (e) {
          print(e);
          AlertUtil.snackbar(context, "Connexion échoué");
        }

        lastState = await widget.device.state.first;
        if (lastState.name == "connected") {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Connecté")));
          goToDevice();
        }
      }
    } else {
      AlertUtil.snackbar(context, "Impossible de connecter cet appareil");
    }
  }

  goToDevice() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DeviceInfoPage(device: widget.device)));
  }

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: ColorUtil.darkenInt(Colors.white, 20)),
        onPressed: tryConnect,
        child: Column(children: [
          Text(widget.device.name),
          Text(widget.device.id.toString()),
          Text(widget.device.type.name),
          Text(lastState.name)
        ]),
      );
}
