import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:growproject/navs/home_nav.dart';
import 'package:growproject/navs/profile_nav.dart';
import 'package:growproject/navs/settings_nav.dart';
import 'package:growproject/constants/bottom_navigation/base_controller.dart';
import 'package:growproject/constants/bottom_navigation/bottom_navigation.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: BaseController.to.currentIndex.value,
            children: [
              HomeNav(),
              SettingsNav(),
              ProfileNav(),
            ],
          )),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
