import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_chart/fl_chart.dart';
import 'chart_widgets/Linechart.dart';
import 'chart_widgets/graphTitle.dart';
import 'chart_widgets/buildCard.dart';

class LightChart extends StatefulWidget {
  const LightChart({super.key});

  @override
  _LightChartState createState() => _LightChartState();
}

class _LightChartState extends State<LightChart> {
  String selectedPeriod = 'Day';

  List<FlSpot> dayData = const [
    FlSpot(0, 20),
    FlSpot(1, 36),
    FlSpot(2, 18),
    FlSpot(3, 40),
    FlSpot(4, 49),
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Light'),
        centerTitle: false,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
                left: 24.w, top: 24.h, right: 24.w, bottom: 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GraphTitle(
                  icons: Icons.wb_sunny_outlined,
                  title:
                      'Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit',
                  title2: '60%',
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
                      minX: 0,
                      maxX: 6,
                      minY: 0,
                      maxY: 60,
                      lineColor: Colors.green,
                      percentages: const [
                        '20%',
                        '36%',
                        '18%',
                        '60%',
                        '40%',
                        '25%',
                        '18%',
                      ],
                      unit: '%',
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildCard('60%', 'Current'),
                    SizedBox(
                      width: 16.w,
                    ),
                    buildCard('72%', 'Recommended'),
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
                    buildCard('456 kw', 'Total'),
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
