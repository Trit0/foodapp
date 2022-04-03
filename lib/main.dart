import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:homer/pages/device_info_page.dart';
import 'package:homer/pages/device_list_page.dart';
import 'package:homer/utils/bluetooth_util.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Homer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Homer'),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Bluetooth.scan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: Bluetooth.connectedDevices,
      builder: (context, AsyncSnapshot<List<BluetoothDevice>?> snapshot) {
        if (snapshot.hasData &&
            snapshot.data != null &&
            snapshot.data!.isNotEmpty) {
          return DeviceInfoPage(device: snapshot.data![0]);
        } else {
          return DeviceListPage(title: widget.title);
        }
      });
}
