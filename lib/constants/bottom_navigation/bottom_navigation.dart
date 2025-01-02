import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:growproject/constants/bottom_navigation/base_controller.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green.shade500,
        elevation: 10,
        currentIndex: BaseController.to.currentIndex.value,
        onTap: (value) => BaseController.to.changePage(value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(size: 24.h, Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(size: 24.h, Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(size: 24.h, Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
