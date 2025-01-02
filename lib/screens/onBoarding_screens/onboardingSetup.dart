import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:growproject/screens/onBoarding_screens.dart/onBoarding_screen1.dart';
import 'package:growproject/screens/onBoarding_screens.dart/onBoarding_screen2.dart';
import 'package:growproject/screens/onBoarding_screens.dart/onBoarding_screen3.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 2);
                });
              },
              children: const [
                OnboardingScreen1(),
                OnboardingScreen2(),
                OnboardingScreen3(),
              ],
            ),
          ),

          // SmoothPageIndicator Section
          Padding(
            padding: EdgeInsets.only(
              bottom: 60.h,
              top: 30.h,
            ),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ExpandingDotsEffect(
                expansionFactor: 3.5, // Фактор розширення для активної точки
                dotHeight: 8.h,
                dotWidth: 8.w,
                activeDotColor: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 30.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    context.push('/connect_device');
                  },
                  child: Text(
                    'Skip',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (onLastPage) {
                      context.push('/connect_device');
                    } else {
                      _controller.nextPage(
                          duration: const Duration(microseconds: 500),
                          curve: Curves.easeInOut);
                    }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF53C904), Color(0xFF2F7302)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Next',
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.white),
                        ),
                        SizedBox(width: 8.w),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.green.shade800,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
