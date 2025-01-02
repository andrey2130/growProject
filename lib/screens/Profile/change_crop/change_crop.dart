import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:growproject/constants/textStryle.dart';
import 'package:growproject/screens/home/home_page.dart';

class ChangeCrop extends StatefulWidget {
  const ChangeCrop({super.key});

  @override
  State<ChangeCrop> createState() => _ChangeCropState();
}

class _ChangeCropState extends State<ChangeCrop> {
  @override
  Widget build(BuildContext context) {
    double progress = currentDay / totalDays;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Change Crop Type',
          style: kTitleText,
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Padding(
        padding:
            EdgeInsets.only(left: 24.w, top: 16.h, bottom: 18.h, right: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'You cannot change crop type until you harvest the current crop.',
            ),
            SizedBox(
              height: 18.h,
            ),
            const Text(
              'Current Crop Type: ',
              style: kSubtitleText,
            ),
            Text('Microgreens', style: kTitleText),
            Padding(
              padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
              child: ProgressBar(progress: progress),
            ),
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
                        '/$totalDays days (${totalDays - currentDay} days till harvest)',
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: GradientButton(
                isActivated: currentDay == totalDays,
              ),
            )
          ],
        ),
      )),
    );
  }
}

class GradientButton extends StatelessWidget {
  final bool isActivated;
  const GradientButton({
    super.key,
    required this.isActivated,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        width: 327,
        decoration: BoxDecoration(
          gradient: isActivated
              ? LinearGradient(
                  colors: [
                    Colors.green.shade800,
                    Colors.green.shade500,
                  ],
                )
              : LinearGradient(
                  colors: [
                    Colors.grey.shade400,
                    Colors.grey.shade400,
                  ],
                ),
          borderRadius: BorderRadius.all(
            Radius.circular(12.r),
          ),
        ),
        child: Center(
          child: TextButton(
            onPressed: () {
              isActivated ? context.push('/selected_crop') : null;
            },
            child: const Text(
              'Change Crop Type',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ));
  }
}
