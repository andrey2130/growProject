import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineChartWidget extends StatefulWidget {
  final String unit;
  final List<FlSpot> spots;
  final List<String> percentages;
  final Color lineColor;

  const LineChartWidget({
    Key? key,
    required this.spots,
    required this.percentages,
    this.lineColor = Colors.green,
    required this.unit,
    required int minX,
    required int maxX,
    required int minY,
    required int maxY,
  }) : super(key: key);

  @override
  State<LineChartWidget> createState() => _LineChartWidgetState();
}

class _LineChartWidgetState extends State<LineChartWidget> {
  @override
  Widget build(BuildContext context) {
    final double minX = widget.spots.isNotEmpty
        ? widget.spots.map((e) => e.x).reduce((a, b) => a < b ? a : b)
        : 0;
    final double maxX = widget.spots.isNotEmpty
        ? widget.spots.map((e) => e.x).reduce((a, b) => a > b ? a : b)
        : 6;
    final double minY = widget.spots.isNotEmpty
        ? widget.spots.map((e) => e.y).reduce((a, b) => a < b ? a : b)
        : 0;
    final double maxY = widget.spots.isNotEmpty
        ? widget.spots.map((e) => e.y).reduce((a, b) => a > b ? a : b)
        : 100;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(widget.percentages.length, (index) {
              return Text(
                '${widget.percentages[index]}',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              );
            }),
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 183.h,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: FlTitlesData(
                leftTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                rightTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                topTitles:
                    const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      const days = [
                        'Mon\n 08',
                        'Tue\n 09',
                        'Wed\n 10',
                        'Thu\n 11',
                        'Fri\n 12',
                        'Sat\n 13',
                        'Sun\n 14'
                      ];
                      return Text(
                        days[value.toInt()],
                        style: TextStyle(color: Colors.grey.shade600),
                      );
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              minX: minX,
              maxX: maxX,
              minY: minY,
              maxY: maxY,
              lineBarsData: [
                LineChartBarData(
                  color: widget.lineColor,
                  barWidth: 1,
                  isStrokeCapRound: true,
                  belowBarData: BarAreaData(
                    show: true,
                    color: widget.lineColor.withOpacity(0.2),
                  ),
                  spots: widget.spots,
                ),
              ],
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((spot) {
                      return LineTooltipItem(
                        '${spot.y.toStringAsFixed(2)} ${widget.unit}',
                        TextStyle(color: Colors.white),
                      );
                    }).toList();
                  },
                ),
                touchCallback:
                    (FlTouchEvent event, LineTouchResponse? touchResponse) {
                  if (event is FlTapUpEvent && touchResponse != null) {
                    final touchedSpot = touchResponse.lineBarSpots?.first;
                    if (touchedSpot != null) {
                      final message =
                          'X: ${touchedSpot.x}, Y: ${touchedSpot.y.toStringAsFixed(2)}';
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message)),
                      );
                    }
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
