import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingCard extends StatelessWidget {
  final String imagePath;
  const OnboardingCard({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 44.w, right: 44.w, top: 48.h, bottom: 48.h),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -19.w,
            top: 20.h,
            child: Container(
              width: 236.w,
              height: 254.h,
              decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(32.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1.r,
                      blurRadius: 5.r,
                      offset: const Offset(0, 3),
                    )
                  ]),
            ),
          ),

          // Лівий контейнер
          Positioned(
            left: -21.w,
            top: 20.h,
            child: Container(
              width: 236.w,
              height: 254.h,
              decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(32.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1.r,
                      blurRadius: 5.r,
                      offset: const Offset(0, 3),
                    )
                  ]),
            ),
          ),

          // Основний центральний контейнер
          Container(
            width: 288.w,
            height: 320.h,
            decoration: BoxDecoration(
              color: const Color(0xFFFFFFFF),
              borderRadius: BorderRadius.circular(32.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1.r,
                  blurRadius: 5.r,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(16.0.w),
                child: Image.asset(
                  imagePath,
                  width: 100.w,
                  height: 168.h,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
