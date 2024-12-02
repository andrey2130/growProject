import 'package:flutter/material.dart';
import 'package:growproject/constants/textStryle.dart';

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 48, bottom: 48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Choose Your Plants',
              style: kTitleText,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Правий контейнер
                  Positioned(
                    right: -19,
                    top: 20,
                    child: Container(
                      width: 236,
                      height: 254,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),

                  // Лівий контейнер
                  Positioned(
                    left: -21,
                    top: 20,
                    child: Container(
                      width: 236,
                      height: 254,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),

                  // Основний центральний контейнер
                  Container(
                    width: 288,
                    height: 320,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image.asset(
                          'images/onboarding2.jpg',
                          width: 100,
                          height: 168,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 48),
              child: Container(
                width: 327,
                height: 100,
                child: const Text(
                  'Connect your GrowBox and control watering, lighting, and temperature right from your smartphone.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
