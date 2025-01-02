import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growproject/constants/card_chart/chart_widgets/Linechart.dart';

class HumidityHistory extends StatefulWidget {
  const HumidityHistory({super.key});

  @override
  State<HumidityHistory> createState() => _HumidityHistoryState();
}

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

class _HumidityHistoryState extends State<HumidityHistory> {
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
        title: const Text('Humidity'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Day',
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Week',
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Month',
                    ),
                  )
                ],
              ),
              LineChartWidget(
                spots: selectedData,
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 100,
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
              SizedBox(
                height: 40.h,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const HisctoricCard(
                    icons: Icons.arrow_downward,
                    lowAndHight: 'Lowest',
                    percentage: '58%',
                    data: '24.12.2024',
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  HisctoricCard(
                    icons: Icons.arrow_upward,
                    lowAndHight: 'Highest',
                    percentage: '18%',
                    data: '24.12.2024',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HisctoricCard extends StatelessWidget {
  final IconData icons;
  final String lowAndHight;
  final String percentage;
  final String data;
  const HisctoricCard({
    super.key,
    required this.icons,
    required this.percentage,
    required this.data,
    required this.lowAndHight,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 12.w, top: 12.h, bottom: 8.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4.r,
            ),
          ],
        ),
        width: 156.w,
        height: 115.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icons,
                  color: Colors.green.shade800,
                ),
                Text(
                  lowAndHight,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
              child: Text(
                percentage,
                style: TextStyle(
                    color: Colors.green.shade500,
                    fontSize: 24,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Text(
              data,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
