import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:homer/utils/bluetooth_util.dart';
import 'package:homer/widgets/device_widget.dart';

class DeviceListPage extends StatefulWidget {
  const DeviceListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _DeviceListPageState createState() => _DeviceListPageState();
}

class _DeviceListPageState extends State<DeviceListPage> {
  List<ScanResult> results = Bluetooth.results;
  ValueNotifier<List<ScanResult>> notifier = ValueNotifier(Bluetooth.results);
  List<Widget> widgets = <Widget>[];

  @override
  void initState() {
    super.initState();
    notifier.addListener(reload);
    refresh();
  }

  refresh() {
    print('reloading');
    setState(() {
      results = Bluetooth.results;
    });
    /*widget.flutterBlue.connectedDevices
        .asStream()
        .listen((List<BluetoothDevice> devices) {
      for (BluetoothDevice device in devices) {
        _addDeviceTolist(device);
      }
    });
    widget.flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        _addDeviceTolist(result.device);
      }
    });*/
  }

  reload() {
    setState(() {
      results = Bluetooth.results;
      widgets.clear();
      for (ScanResult result in results) {
        widgets.add(
          DeviceWidget(result: result),
        );
      }
      if (widgets.isEmpty) {
        widgets.add(Column(
          children: [
            const Text('Aucun appareil détecté'),
            ElevatedButton(onPressed: reload, child: const Text('Actualiser'))
          ],
        ));
      }
    });
  }

  dynamic _buildListViewOfDevices() {
    reload();

    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ValueListenableBuilder(
            valueListenable: notifier,
            builder: (context, value, widget) {
              return Column(
                children: [...widgets],
              );
            }));
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: _buildListViewOfDevices(),
      );
}
