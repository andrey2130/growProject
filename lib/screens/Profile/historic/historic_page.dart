import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:growproject/constants/nav_ids.dart';

class HistoricPage extends StatelessWidget {
  const HistoricPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Historic'),
        centerTitle: false,
      ),
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.only(left: 24.w, right: 24.w, bottom: 16.h, top: 24.h),
          child: Column(
            children: [
              Row(
                children: [
                  HiscroricCard(
                    onTap: () {
                      Get.toNamed('/profile/lightHistoric', id: NavIds.profile);
                    },
                    icons: FontAwesomeIcons.lightbulb,
                    title: 'Light',
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  HiscroricCard(
                    onTap: () {
                      Get.toNamed('/profile/tepmeratureHistoric',
                          id: NavIds.profile);
                    },
                    icons: Icons.thermostat,
                    title: 'Temperature',
                  ),
                ],
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  HiscroricCard(
                      icons: Icons.opacity,
                      title: 'Humiditu',
                      onTap: () {
                        Get.toNamed('/profile/humidityHistoric',
                            id: NavIds.profile);
                      }),
                  SizedBox(
                    width: 16.w,
                  ),
                  HiscroricCard(
                      icons: FontAwesomeIcons.seedling,
                      title: 'Nutrition',
                      onTap: () {
                        Get.toNamed('/profile/nutritionHistoric',
                            id: NavIds.profile);
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HiscroricCard extends StatelessWidget {
  final IconData icons;
  final String title;
  final VoidCallback onTap;
  const HiscroricCard({
    super.key,
    required this.icons,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(top: 12.h, left: 12.w, bottom: 12.h),
          width: 156.w,
          height: 81.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1.r,
                blurRadius: 5.r,
                offset: const Offset(0, 3),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icons,
                color: Colors.green.shade800,
              ),
              SizedBox(height: 8.h),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
