import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:growproject/constants/nav_ids.dart';
import 'package:growproject/constants/card_chart/humidity_chart.dart';
import 'package:growproject/constants/card_chart/nutrition_chart.dart';
import 'package:growproject/constants/card_chart/temperature_chart.dart';
import 'package:growproject/screens/home/home_page.dart';
import 'package:growproject/constants/card_chart/light_chart.dart';

class HomeNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(NavIds.home),
      onGenerateRoute: (settings) {
        if (settings.name == '/home/nutririon') {
          return GetPageRoute(
            settings: settings,
            page: () => NutritionChart(),
          );
        } else if (settings.name == '/home/humidity') {
          return GetPageRoute(
            settings: settings,
            page: () => HumidityChart(),
          );
        } else if (settings.name == '/home/temperature') {
          return GetPageRoute(
            settings: settings,
            page: () => TemperatureChart(),
          );
        } else if (settings.name == '/home/Light') {
          return GetPageRoute(
            settings: settings,
            page: () => LightChart(),
          );
        } else {
          return GetPageRoute(
            settings: settings,
            page: () => HomePage(),
          );
        }
      },
    );
  }
}
