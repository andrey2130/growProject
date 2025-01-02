import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:go_router/go_router.dart';

import 'package:growproject/constants/textStryle.dart';

class SearchingDevice extends StatefulWidget {
  const SearchingDevice({super.key});

  @override
  State<SearchingDevice> createState() => _SearchingDeviceState();
}

class _SearchingDeviceState extends State<SearchingDevice>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _hasNavigated = false;

  final List<ScanResult> _scanResults = [];
  final StreamController<List<ScanResult>> _scanResultsStreamController =
      StreamController.broadcast();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: false);

    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);

    _enableBLE();
    FlutterBluePlus.setLogLevel(LogLevel.verbose, color: false);
  }

  @override
  void dispose() {
    _scanResultsStreamController.close();
    _controller.dispose();
    super.dispose();
  }

  Future<void> _enableBLE() async {
    final isSupported = await FlutterBluePlus.isSupported;
    if (!isSupported) {
      log('BLE not supported');
      return;
    }

    final state = await FlutterBluePlus.adapterState.first;
    if (state != BluetoothAdapterState.on) {
      log('Bluetooth is off');
      return;
    }

    FlutterBluePlus.onScanResults.listen(
      (results) {
        for (var result in results) {
          final deviceName = result.advertisementData.localName;
          final deviceId = result.device.remoteId;

          if (deviceName.isNotEmpty &&
              !_scanResults.any((r) => r.device.remoteId == deviceId)) {
            _scanResults.add(result);
            _scanResultsStreamController.add(_scanResults);
            log('Added device: $deviceName ($deviceId)');
          }
        }

        if (_scanResults.isNotEmpty && !_hasNavigated) {
          _hasNavigated = true; // Помічаємо, що навігація вже відбулася
          _navigateToDeviceList();
        } else {
          log('No devices found or already navigated');
        }
      },
      onError: (e) => log('Error during scan: $e'),
    );

    // Стартуємо сканування
    FlutterBluePlus.startScan(timeout: Duration(seconds: 15));
  }

  void _navigateToDeviceList() {
    context.push(
      '/connect_devices',
      extra: _scanResultsStreamController.stream,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
                child: const Column(
                  children: [
                    Center(
                      child: Text(
                        'Searching for devices...',
                        style: kTitleText,
                      ),
                    ),
                    Center(
                      child: Text(
                        'It can take a couple of minutes',
                        style: kSubtitleText,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Center(
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 451 * _animation.value,
                            height: 451 * _animation.value,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFF5F8F2),
                            ),
                          ),
                          Container(
                            width: 308 * _animation.value,
                            height: 308 * _animation.value,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFD5E3CC),
                            ),
                          ),
                          Container(
                            width: 173.93 * _animation.value,
                            height: 173.93 * _animation.value,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF97B980),
                            ),
                          ),
                          Container(
                            width: 41 * _animation.value,
                            height: 41 * _animation.value,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF2F7302),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Align(
                  alignment: Alignment.bottomCenter,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
