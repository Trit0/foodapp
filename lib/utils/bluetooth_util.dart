import 'package:flutter_blue/flutter_blue.dart';

class Bluetooth {
  static final FlutterBlue _flutterBlue = FlutterBlue.instance;
  static List<ScanResult> _results = <ScanResult>[];
  static List<BluetoothDevice>? connectedDevice;

  static void scan() async {
    if (await _flutterBlue.isAvailable) {
      if (await _flutterBlue.isOn) {
        if (!await _flutterBlue.isScanning.first) {
          print('Starting scan');
          _flutterBlue.startScan();
          _flutterBlue.scanResults.listen((event) {
            _results = [..._results, ...event];
            print(event.toString());
          });
        } else {
          print('already scanning');
        }
      } else {
        print('Off');
      }
    } else {
      print('Unavailable');
    }
  }

  static Future<List<BluetoothDevice>?> get connectedDevices async {
    connectedDevice = await _flutterBlue.connectedDevices;
    return connectedDevice;
  }

  static List<BluetoothDevice> get devices {
    return _results.map((e) => e.device).toList();
  }

  static List<ScanResult> get results {
    return _results;
  }
}
