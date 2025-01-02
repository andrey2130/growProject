import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:growproject/constants/textStryle.dart';

class ConnectDevice extends StatefulWidget {
  const ConnectDevice({super.key});

  @override
  State<ConnectDevice> createState() => _ConnectDeviceState();
}

class _ConnectDeviceState extends State<ConnectDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 88, left: 24, right: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                textAlign: TextAlign.center,
                'Connect your mobile device to GrowBox',
                style: kTitleText,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  textAlign: TextAlign.center,
                  'Make sure that Bluethooth on your mobile device is turned on',
                  style: kSubtitleText,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 60),
                child: Center(
                  child: Image(
                    height: 142,
                    width: 142,
                    image: AssetImage('images/connectDevice.jpg'),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: TextButton(
                    onPressed: () {
                      context.go('/base_screen');
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 17, right: 10, bottom: 17, left: 10),
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
                        child: const Center(
                          child: Text(
                            'Connect your device',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
