import 'package:flutter/material.dart';
import 'package:growproject/constants/oBoarding_card.dart';
import 'package:growproject/constants/textStryle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: 48.h,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Choose Your Plants',
                  style: kTitleText,
                ),
                const Column(
                  children: [
                    OnboardingCard(
                      imagePath: 'images/image.png',
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 23.5.w,
                    right: 23.5.w,
                  ),
                  child: const Text(
                    'Welcome to GrowBox! Select your favorite plants and begin cultivating your personal garden.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
