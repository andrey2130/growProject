import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:growproject/constants/textStryle.dart';
import 'package:growproject/screens/device_connection_screen/device_data.dart';

class DeviceList extends StatelessWidget {
  final Stream<List<ScanResult>> deviceStream;

  const DeviceList({Key? key, required this.deviceStream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Connect device:', style: kTitleText),
            ),
            Expanded(
              child: StreamBuilder<List<ScanResult>>(
                stream: deviceStream,
                builder: (context, snapshot) {
                  final devices = snapshot.data ?? [];

                  return devices.isEmpty
                      ? const Center()
                      : ListView.builder(
                          itemCount: devices.length,
                          itemBuilder: (context, index) {
                            final device = devices[index];
                            final deviceName =
                                device.advertisementData.advName.isNotEmpty
                                    ? device.advertisementData.advName
                                    : 'Unnamed Device';
                            final deviceId = device.device.remoteId.toString();

                            return GestureDetector(
                              onTap: () {
                                final deviceData = BluethoothDeviceData(
                                  id: deviceId,
                                  name: deviceName,
                                  version: deviceId,
                                  model: device.advertisementData
                                          .manufacturerData.isNotEmpty
                                      ? String.fromCharCode(device
                                          .advertisementData
                                          .manufacturerData
                                          .values
                                          .first as int)
                                      : 'Unknow',
                                );
                                context.push('/connecting_device', extra: deviceData);
                              },
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          blurRadius: 12,
                                          offset: Offset(0, 4))
                                    ]),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'images/connectDevice.jpg',
                                      height: 79,
                                      width: 79,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            deviceName,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Text(
                                            deviceId,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.green.shade800,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            'Version: ${device.advertisementData.manufacturerData.isNotEmpty ? String.fromCharCodes(device.advertisementData.manufacturerData.values.first) : 'Unknown Version'}',
                                            style: TextStyle(
                                                color: Colors.grey.shade400,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
