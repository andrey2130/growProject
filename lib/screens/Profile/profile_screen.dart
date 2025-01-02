import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:growproject/constants/nav_ids.dart';
import 'package:growproject/constants/textStryle.dart';
import 'package:growproject/screens/Profile/myHarvest/myHarvest.dart';
import 'package:growproject/screens/Settings/settings_screen.dart';
import 'package:growproject/screens/device_connection_screen/selected_crop_type.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? userEmail;

  @override
  void initState() {
    super.initState();
    loadedUserDara();
  }

  Future<void> loadedUserDara() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userEmail = prefs.getString('userEmail');
    });
  }

  Future<void> logout({required BuildContext context}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userEmail');

    context.go('/SingInScreen');
  }

  @override
  Widget build(BuildContext context) {
    final selectedCrop = Provider.of<ChangeCropType>(context).selectedCrop;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'Profile',
                  style: kTitleText,
                ),
              ),
              CustomContainer(
                child: Column(
                  children: [
                    Image.asset(
                        width: 33.25.w,
                        height: 35.h,
                        'images/image copy 3.png'),
                    Padding(
                      padding: EdgeInsets.only(top: 4.h, bottom: 4.h),
                      child: Text(
                        'Fantastik Gin-10',
                        style: TextStyle(
                          color: Colors.green.shade800,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      '$userEmail',
                      style: kSubtitleText,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextCards(
                          text: 'Total Harvest',
                          subTitleText: '5',
                        ),
                        Container(
                          height: 28.h,
                          width: 1.5.w,
                          color: Colors.green,
                        ),
                        TextCards(
                          text: 'Corp Type',
                          subTitleText: '$selectedCrop',
                        ),
                        Container(
                          height: 28.h,
                          width: 1.5.w,
                          color: Colors.green,
                        ),
                        TextCards(
                          text: 'Total Days',
                          subTitleText: totalDays.toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: CustomContainer(
                  child: CustomWidgetsLocation(
                    icons: const Icon(
                      Icons.change_circle,
                      color: Colors.green,
                    ),
                    text: 'Change Crop Type',
                    iconsButtons: IconButton(
                      onPressed: () {
                        Get.toNamed('/profile/changeCrop', id: NavIds.profile);
                      },
                      icon: const Icon(Icons.arrow_right),
                    ),
                  ),
                ),
              ),
              CustomContainer(
                child: CustomWidgetsLocation(
                  icons: const Icon(
                    Icons.local_florist,
                    color: Colors.green,
                  ),
                  text: 'My Harvest',
                  iconsButtons: IconButton(
                    onPressed: () {
                      Get.toNamed('/profile/myHarvest', id: NavIds.profile);
                    },
                    icon: const Icon(Icons.arrow_right),
                  ),
                ),
              ),
              CustomContainer(
                child: CustomWidgetsLocation(
                  icons: const Icon(
                    Icons.history,
                    color: Colors.green,
                  ),
                  text: 'Historic Data',
                  iconsButtons: IconButton(
                    onPressed: () {
                      Get.toNamed('/profile/historic', id: NavIds.profile);
                    },
                    icon: const Icon(Icons.arrow_right),
                  ),
                ),
              ),
              CustomContainer(
                child: CustomWidgetsLocation(
                  icons: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  text: 'Log Out',
                  textStyle: const TextStyle(
                    color: Colors.red,
                  ),
                  iconsButtons: IconButton(
                    onPressed: () {
                      logout(context: context);
                    },
                    icon: const Icon(Icons.arrow_right),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomWidgetsLocation extends StatelessWidget {
  final Icon icons;
  final String text;
  final TextStyle? textStyle;

  final IconButton iconsButtons;
  const CustomWidgetsLocation({
    super.key,
    required this.icons,
    required this.text,
    required this.iconsButtons,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icons,
        SizedBox(width: 8.w),
        Text(
          text,
          style: textStyle,
        ),
        Expanded(
          child: Container(),
        ),
        iconsButtons
      ],
    );
  }
}

class TextCards extends StatelessWidget {
  final String text;
  final String subTitleText;
  const TextCards({
    super.key,
    required this.text,
    required this.subTitleText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
        Text(
          subTitleText,
          style: TextStyle(
            color: Colors.green.shade500,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
