import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:growproject/constants/nav_ids.dart';

final int currentDay = 21;
final int totalDays = 21;

class CardData {
  final IconData icon;
  final String label;
  final String? value;
  final Widget? additionalWidget;
  final bool? switchValue;
  final ValueChanged<bool>? onSwitchChanged;
  final VoidCallback onTap;

  CardData({
    required this.onTap,
    required this.icon,
    required this.label,
    this.value,
    this.additionalWidget,
    this.switchValue,
    this.onSwitchChanged,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ventStatus = true;
  bool wateringStatus = true;

  late final List<CardData> cardDataList;

  @override
  Widget build(BuildContext context) {
    double progress = currentDay / totalDays;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Image.asset(
                'images/image copy 2.png',
                width: 150.w,
                height: 160.h,
              ),
              const Text(
                'Microgreens',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              SizedBox(width: 193.w, child: ProgressBar(progress: progress)),
              SizedBox(height: 5.h),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  children: [
                    TextSpan(
                      text: '$currentDay',
                      style: TextStyle(color: Colors.green.shade500),
                    ),
                    TextSpan(
                      text:
                          '/$totalDays days (${totalDays - currentDay} days till harvest)', // Решта тексту
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              _CardSection(cardDataList: [
                CardData(
                  icon: FontAwesomeIcons.lightbulb,
                  label: 'Light',
                  value: '60%',
                  onTap: () {
                    Get.toNamed('/home/Light', id: NavIds.home);
                  },
                ),
                CardData(
                  icon: Icons.thermostat,
                  label: 'Temperature',
                  value: '24 °C',
                  onTap: () {
                    Get.toNamed('/home/temperature', id: NavIds.home);
                  },
                ),
                CardData(
                  icon: Icons.opacity,
                  label: 'Humidity',
                  value: '58%',
                  onTap: () {
                    Get.toNamed(
                      '/home/humidity',
                      id: NavIds.home,
                    );
                  },
                ),
                CardData(
                  icon: FontAwesomeIcons.seedling,
                  label: 'Nutrition',
                  value: '78%',
                  onTap: () {
                    Get.toNamed('/home/nutririon', id: NavIds.home);
                  },
                ),
                CardData(
                  icon: FontAwesomeIcons.fan,
                  label: 'Vent',
                  switchValue: ventStatus,
                  onSwitchChanged: (value) {
                    setState(() {
                      ventStatus = value;
                    });
                  },
                  onTap: () {},
                ),
                CardData(
                  icon: Icons.water_outlined,
                  label: 'Watering',
                  switchValue: wateringStatus,
                  onSwitchChanged: (value) {
                    setState(() {
                      wateringStatus = value;
                    });
                  },
                  onTap: () {},
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressBar extends StatelessWidget {
  final double progress;

  const ProgressBar({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 8.h,
          width: 240.w,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        FractionallySizedBox(
          alignment: Alignment.centerLeft,
          widthFactor: progress,
          child: Container(
            height: 8.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: const LinearGradient(
                colors: [Color(0xFF32CD32), Color(0xFF228B22)],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CardSection extends StatelessWidget {
  final List<CardData> cardDataList;

  const _CardSection({required this.cardDataList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          for (int i = 0; i < cardDataList.length; i += 2)
            Row(
              children: [
                CustomCard(
                  data: cardDataList[i],
                ),
                SizedBox(width: 16.w),
                if (i + 1 < cardDataList.length)
                  CustomCard(
                    data: cardDataList[i + 1],
                  ),
                if (i + 1 >= cardDataList.length) Spacer(),
              ],
            ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final CardData data;

  const CustomCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: data.onTap,
        child: Container(
          margin: EdgeInsets.only(right: 8.w, top: 16.h),
          padding: EdgeInsets.only(top: 12.h, left: 12.w, bottom: 12.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4.r)],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(data.icon, size: 24.sp, color: Colors.green),
              SizedBox(height: 8.h),
              if (data.value != null)
                Text(data.value!,
                    style: TextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.bold)),
              if (data.switchValue != null && data.onSwitchChanged != null)
                Switch.adaptive(
                  value: data.switchValue!,
                  onChanged: data.onSwitchChanged!,
                  activeTrackColor: Colors.green.shade200,
                  inactiveTrackColor: Colors.grey.shade400,
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.white,
                ),
              SizedBox(height: 8.h),
              Text(data.label,
                  style:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ),
    );
  }
}
