import 'package:go_router/go_router.dart';
import 'package:growproject/device_connection_screen/connect_device.dart';
import 'package:growproject/login_screens/log_in_screen.dart';
import 'package:growproject/onBoarding_screens.dart/Intro.dart';

import 'package:growproject/login_screens/sing_up_screen.dart';
import 'package:growproject/login_screens/welcomeApp_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeAppScreen(),
    ),
    GoRoute(
      path: '/SingUpScreen',
      builder: (context, state) => const SingUpScreen(),
    ),
    GoRoute(
      path: '/SingInScreen',
      builder: (context, state) => const SingInScreen(),
    ),
    GoRoute(
      path: '/OnBoardingScreen1',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/connect_device',
      builder: (context, state) => const ConnectDevice(),
    ),
  ],
);
