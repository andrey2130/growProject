import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:go_router/go_router.dart';
import 'package:growproject/screens/device_connection_screen/connected_device.dart';
import 'package:growproject/screens/device_connection_screen/connect_device.dart';
import 'package:growproject/screens/device_connection_screen/device_data.dart';
import 'package:growproject/screens/device_connection_screen/device_list.dart';
import 'package:growproject/screens/device_connection_screen/connecting_device.dart';
import 'package:growproject/screens/device_connection_screen/searchingDevice.dart';
import 'package:growproject/screens/device_connection_screen/selected_crop_type.dart';
import 'package:growproject/constants/bottom_navigation/base_screen.dart';
import 'package:growproject/screens/home/home_page.dart';
import 'package:growproject/constants/card_chart/light_chart.dart';
import 'package:growproject/screens/Profile/profile_screen.dart';
import 'package:growproject/screens/login_screens/log_in_screen.dart';
import 'package:growproject/screens/onBoarding_screens.dart/onboardingSetup.dart';
import 'package:growproject/screens/login_screens/sing_up_screen.dart';
import 'package:growproject/screens/login_screens/welcomeApp_screen.dart';
import 'package:growproject/screens/Settings/settings_screen.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const WelcomeAppScreen(),
  ),
  GoRoute(
    path: '/SingUpScreen',
    builder: (context, state) => const SignUpScreen(),
  ),
  GoRoute(
    path: '/SingInScreen',
    builder: (context, state) => const SignInScreen(),
  ),
  GoRoute(
    path: '/OnBoardingScreen1',
    builder: (context, state) => const OnboardingScreen(),
  ),
  GoRoute(
    path: '/connect_device',
    builder: (context, state) => const ConnectDevice(),
  ),
  GoRoute(
    path: '/searching_Devices',
    builder: (context, state) => SearchingDevice(),
  ),
  GoRoute(
      path: '/connect_devices',
      builder: (context, state) {
        final deviceStream = state.extra as Stream<List<ScanResult>>;
        return DeviceList(deviceStream: deviceStream);
      }),
  GoRoute(
    path: '/connecting_device',
    builder: (context, state) {
      final device = state.extra as BluethoothDeviceData;
      return ConnectingDevice(
        devices: device,
      );
    },
  ),
  GoRoute(
    path: '/connected_device',
    builder: (context, state) {
      final device = state.extra as BluethoothDeviceData;
      return ConnectedDevice(devices: device);
    },
  ),
  GoRoute(
    path: '/selected_crop',
    builder: (context, state) => SelectedCropType(),
  ),
  GoRoute(path: '/home', builder: (context, state) => HomePage(), routes: [
    GoRoute(
      path: '/light_chart',
      builder: (context, state) => LightChart(),
    ),
  ]),
  GoRoute(
    path: '/settings',
    builder: (context, state) => const SettingsScreen(),
  ),
  GoRoute(path: '/profile', builder: (context, state) => ProfileScreen()),
  GoRoute(path: '/base_screen', builder: (context, state) => BaseScreen()),
]);
