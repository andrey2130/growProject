import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:growproject/constants/textStryle.dart';
import 'package:growproject/screens/device_connection_screen/device_data.dart';

class ConnectingDevice extends StatefulWidget {
  final BluethoothDeviceData devices;
  const ConnectingDevice({super.key, required this.devices});

  @override
  State<ConnectingDevice> createState() => _ConnectingDeviceState();
}

class _ConnectingDeviceState extends State<ConnectingDevice> {
  double progress = 0.0;
  BluetoothDevice? _device;
  bool _isNavigated = false;
  StreamSubscription? _stateSubscription;
  @override
  void initState() {
    super.initState();
    connectToDevice();
    simulateConnectionProgress();
  }

  Future<void> connectToDevice() async {
    try {
      _device = BluetoothDevice(remoteId: DeviceIdentifier(widget.devices.id));

      setState(() {
        progress = 0.1;
      });

      await _device?.connect();

      // Основна підписка на стан пристрою
      _stateSubscription = _device?.state.listen((state) {
        log('Device state: $state');
        if (state == BluetoothConnectionState.connected && !_isNavigated) {
          _isNavigated = true; // Запобігаємо повторній навігації
          _stateSubscription?.cancel(); // Відписуємось від оновлень
          context.push('/connected_device', extra: widget.devices);
        } else if (state == BluetoothConnectionState.disconnected) {
          log('Device disconnected');
          setState(() {
            progress = 0.0;
          });
        }
      });

      setState(() {
        progress = 0.5; // Оновлення прогресу
      });
    } catch (e) {
      log('Error during connection: $e');
      setState(() {
        progress = 0.0;
      });
    }
  }

  @override
  void dispose() {
    _stateSubscription?.cancel();
    super.dispose();
  }

  void updateProgress(double value) {
    setState(() {
      progress = value;

      if (progress == 1.0) {
        context.push('/connected_device', extra: widget.devices);
      }
    });
  }

  Future<void> simulateConnectionProgress() async {
    await Future.delayed(const Duration(seconds: 1));
    updateProgress(0.2);

    await Future.delayed(const Duration(seconds: 1));
    updateProgress(0.4);

    await Future.delayed(const Duration(seconds: 1));
    updateProgress(0.6);

    await Future.delayed(const Duration(seconds: 1));
    updateProgress(0.8);

    await Future.delayed(const Duration(seconds: 1));
    updateProgress(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Text(
            'Connecting...',
            style: kTitleText,
          ),
          const SizedBox(height: 8),
          const Text(
            'It can take a couple of minutes',
            style: kSubtitleText,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 40, bottom: 24, left: 24, right: 24),
            child: LinearProgressIndicator(
              color: Colors.green,
              value: progress,
              minHeight: 12,
              backgroundColor: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          Text(
            ' ${widget.devices.name}',
            style: kTitleText,
          ),
          Text(
            '${widget.devices.model}',
            style: TextStyle(
                color: Colors.green.shade800,
                fontSize: 14,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Version ${widget.devices.version}',
            style: kSubtitleText,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Image.asset(
                height: 142, width: 142, 'images/connectDevice.jpg'),
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: SizedBox(
              width: 327,
              height: 48,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  side: BorderSide(
                    color: Colors.green.shade800,
                    width: 1,
                  ),
                ),
                onPressed: () {
                  FlutterBluePlus.stopScan();
                  Navigator.pop(context);
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      color: Colors.green.shade800,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
