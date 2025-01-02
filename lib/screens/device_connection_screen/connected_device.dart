import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:growproject/constants/textStryle.dart';
import 'package:growproject/screens/device_connection_screen/device_data.dart';

class ConnectedDevice extends StatefulWidget {
  final BluethoothDeviceData devices;
  const ConnectedDevice({super.key, required this.devices});

  @override
  State<ConnectedDevice> createState() => _ConnectedDeviceState();
}

class _ConnectedDeviceState extends State<ConnectedDevice> {
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
            'Connected',
            style: kTitleText,
          ),
          const SizedBox(height: 40),
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
              child: Container(
                  height: 48,
                  width: 327,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF53C904), Color(0xFF2F7302)],
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        context.push('/selected_crop');
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}
