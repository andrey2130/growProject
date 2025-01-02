import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growproject/constants/card_chart/chart_widgets/Linechart.dart';
import 'package:growproject/constants/card_chart/chart_widgets/buildCard.dart';
import 'chart_widgets/graphTitle.dart';

class TemperatureChart extends StatefulWidget {
  const TemperatureChart({super.key});

  @override
  State<TemperatureChart> createState() => _TemperatureChartState();
}

class _TemperatureChartState extends State<TemperatureChart> {
  String selectedPeriod = 'Day';

  List<FlSpot> dayData = const [
    FlSpot(0, 20),
    FlSpot(1, 36),
    FlSpot(2, 18),
    FlSpot(3, 40),
    FlSpot(4, 60),
    FlSpot(5, 25),
    FlSpot(6, 18),
  ];

  List<FlSpot> weekData = const [
    FlSpot(0, 25),
    FlSpot(1, 45),
    FlSpot(2, 35),
    FlSpot(3, 55),
    FlSpot(4, 65),
    FlSpot(5, 30),
    FlSpot(6, 40),
  ];

  List<FlSpot> monthData = const [
    FlSpot(0, 30),
    FlSpot(1, 50),
    FlSpot(2, 40),
    FlSpot(3, 60),
    FlSpot(4, 70),
    FlSpot(5, 40),
    FlSpot(6, 50),
  ];

  @override
  Widget build(BuildContext context) {
    List<FlSpot> selectedData;
    if (selectedPeriod == 'Day') {
      selectedData = dayData;
    } else if (selectedPeriod == 'Week') {
      selectedData = weekData;
    } else {
      selectedData = monthData;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Temperature'),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                left: 24.w, top: 24.h, right: 24.w, bottom: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GraphTitle(
                  title:
                      'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit',
                  icons: Icons.thermostat_outlined,
                  title2: '24 °C',
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedPeriod = 'Day';
                        });
                      },
                      child: const Text('Day'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedPeriod = 'Week';
                        });
                      },
                      child: const Text('Week'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedPeriod = 'Month';
                        });
                      },
                      child: const Text('Month'),
                    ),
                  ],
                ),
                Column(
                  children: [
                    LineChartWidget(
                      spots: selectedData,
                      percentages: const [
                        '24 °C',
                        '26 °C',
                        '23 °C',
                        '28 °C',
                        '24 °C',
                        '26 °C',
                        '23 °C',
                      ],
                      minX: 0,
                      maxX: 100,
                      minY: 8,
                      maxY: 18,
                      unit: '`C',
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildCard('24 `C', 'Curent'),
                    SizedBox(
                      width: 16.w,
                    ),
                    buildCard('26 `C', 'Recommended'),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    buildCard('60 kw', 'Week'),
                    SizedBox(
                      width: 16.w,
                    ),
                    buildCard('456 kw', 'total'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
