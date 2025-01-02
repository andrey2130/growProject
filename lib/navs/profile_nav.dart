import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:growproject/constants/nav_ids.dart';
import 'package:growproject/screens/Profile/change_crop/change_crop.dart';
import 'package:growproject/screens/Profile/historic/historic_page.dart';
import 'package:growproject/screens/Profile/historic/humidity_history.dart';
import 'package:growproject/screens/Profile/historic/light_history.dart';
import 'package:growproject/screens/Profile/historic/nutrition_historic.dart';
import 'package:growproject/screens/Profile/historic/tepmerature_history.dart';
import 'package:growproject/screens/Profile/myHarvest/myHarvest.dart';
import 'package:growproject/screens/Profile/profile_screen.dart';

class ProfileNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.profile),
      onGenerateRoute: (settings) {
        if (settings.name == '/profile/myHarvest') {
          return GetPageRoute(
            settings: settings,
            page: () => Myharvest(),
          );
        } else if (settings.name == '/profile/changeCrop') {
          return GetPageRoute(
            settings: settings,
            page: () => ChangeCrop(),
          );
        } else if (settings.name == '/profile/nutritionHistoric') {
          return GetPageRoute(
            settings: settings,
            page: () => NutritionHistory(),
          );
        } else if (settings.name == '/profile/humidityHistoric') {
          return GetPageRoute(
            settings: settings,
            page: () => HumidityHistory(),
          );
        } else if (settings.name == '/profile/tepmeratureHistoric') {
          return GetPageRoute(
            settings: settings,
            page: () => TemperatureHistory(),
          );
        } else if (settings.name == '/profile/lightHistoric') {
          return GetPageRoute(
            settings: settings,
            page: () => LightHistory(),
          );
        } else if (settings.name == '/profile/historic') {
          return GetPageRoute(
            settings: settings,
            page: () => HistoricPage(),
          );
        } else {
          return GetPageRoute(
            settings: settings,
            page: () => ProfileScreen(),
          );
        }
      },
    );
  }
}
