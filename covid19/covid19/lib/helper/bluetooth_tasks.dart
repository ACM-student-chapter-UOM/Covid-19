import 'dart:convert';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:crypto/crypto.dart';

class BluetoothTasks {
  // Singleton
  BluetoothTasks._();
  static final BluetoothTasks _instance = BluetoothTasks._();
  static BluetoothTasks get instance => _instance;

  //Createing an instance of Flutter_Bluetooth_Serial
  FlutterBluetoothSerial _flutterBLInstance = FlutterBluetoothSerial.instance;

  /// Checks whether the device support bluetooth and enables if so.
  ///
  /// This method should be called on app start.
  void initialize() {
    _flutterBLInstance.isAvailable.then(
      (isAvailable) {
        if (isAvailable) {
          enableBluetooth();
        }
      },
    );
  }

  /// Enables the bluetooth if bluetooth is disabled.
  ///
  /// This method may be used to check and enable bluetooth when opening the app.
  void enableBluetooth() {
    _flutterBLInstance.isEnabled.then(
      (enabled) {
        if (!enabled) {
          _flutterBLInstance.requestEnable();
        }
      },
    );
  }

  /// Returns the hardware address of the device bluetooth adapter.
  ///
  /// This property maybe used to get the local bluetooth adapter address to register the app.
  Future<String> get deviceBluetoothAddress => _flutterBLInstance.address;

  /// Make the bluetooth discoverable by other devices.
  ///
  /// This method will be used to make the device discoverable for other devices.
  Future<int> makeDeviceDiscoverable(int seconds) async {
    await _flutterBLInstance.isDiscoverable.then(
      (isDiscoverable) {
        if (!isDiscoverable) {
          return _flutterBLInstance.requestDiscoverable(seconds);
        }
        return null;
      },
    );
    return null;
  }

  /// Scan for nearby bluetooth devices.
  ///
  /// This method will be used to scan and compare nearby bluetooth devices.
  Future<void> scanBluetoothDevices(int intervalInMinutes) async {
    while (true) {
      Set blIDs = Set();
      _flutterBLInstance.startDiscovery().listen(
        (blData) {
          List<int> bytes = utf8.encode(blData.device.address);
          Digest digest = sha1.convert(bytes);
          blIDs.add(digest.toString());
        },
        onDone: () {
          print(blIDs);
        },
      );
      await Future.delayed(Duration(seconds: intervalInMinutes));
    }
  }
}
