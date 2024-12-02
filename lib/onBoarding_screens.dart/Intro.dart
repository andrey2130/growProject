import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:growproject/onBoarding_screens.dart/onBoarding_screen1.dart';
import 'package:growproject/onBoarding_screens.dart/onBoarding_screen2.dart';
import 'package:growproject/onBoarding_screens.dart/onBoarding_screen3.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();

  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
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
            Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                  expansionFactor: 3.5, // Фактор розширення для активної точки

                  dotHeight: 8,
                  dotWidth: 8,

                  activeDotColor: Colors.green,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      context.go('/connect_device');
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (onLastPage) {
                        context.go('/connect_device');
                      } else {
                        _controller.nextPage(
                            duration: Duration(microseconds: 500),
                            curve: Curves.easeInOut);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF53C904), Color(0xFF2F7302)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Next',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          const SizedBox(width: 8),
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
      ),
    );
  }
}
