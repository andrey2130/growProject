import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:growproject/constants/nav_ids.dart';
import 'package:growproject/screens/Settings/settings_screen.dart';

class SettingsNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.settings),
      onGenerateRoute: (settings) {
        if (settings.name != '/settings') {
          return GetPageRoute(
            settings: settings,
            page: () => SettingsScreen(),
          );
        }
        return null;
      },
    );
  }
}
