import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:growproject/route/route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growproject/screens/device_connection_screen/selected_crop_type.dart';
import 'package:growproject/constants/bottom_navigation/base_controller.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final cropProvider = ChangeCropType();
  await cropProvider.loadSelectedCrop();

  Get.put<BaseController>(BaseController());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ChangeCropType>.value(
          value: cropProvider,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(327, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp.router(
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
