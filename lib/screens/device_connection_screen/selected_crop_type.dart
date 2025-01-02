import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:growproject/constants/textStryle.dart';
import 'dart:io' show Platform;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> cropTypes = [
  'Flovering Plants',
  'Herbs',
  'Microgreens',
  'Mushroom\'s',
  'Vegetables'
];

int selectedIndex = 2;
var selectedItems = cropTypes[selectedIndex];

class ChangeCropType with ChangeNotifier {
  String? _selectedCrop;

  String? get selectedCrop => _selectedCrop;

  Future<void> loadSelectedCrop() async {
    final prefs = await SharedPreferences.getInstance();
    _selectedCrop = prefs.getString('selectedCrop') ?? 'Default Crop';
    notifyListeners();
  }

  Future<void> setSelectedCrop(String crop) async {
    _selectedCrop = crop;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    bool success = await prefs.setString('selectedCrop', crop);
    if (!success) {
      print('Failed to save data in SharedPreferences');
    }
  }
}

// ignore: must_be_immutable
class SelectedCropType extends StatefulWidget {
  SelectedCropType({super.key});

  @override
  State<SelectedCropType> createState() => _SelectedCropTypeState();
}

class _SelectedCropTypeState extends State<SelectedCropType> {
  String? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: 16,
              ),
              child: Text(
                'Select crop type',
                style: kTitleText,
              ),
            ),
            Expanded(
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 40, // Висота елемента
                scrollController:
                    FixedExtentScrollController(initialItem: selectedIndex),
                onSelectedItemChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                children: cropTypes.map((type) {
                  final isSelected = cropTypes.indexOf(type) == selectedIndex;
                  return Center(
                    child: Text(
                      type,
                      style: TextStyle(
                        fontSize: isSelected ? 24 : 24,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        color: isSelected
                            ? Colors.green.shade800
                            : const Color(0xFF97B980),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 24.h, left: 24.w, right: 24.w),
              child: SizedBox(
                width: 327.w,
                height: 48.h,
                child: Container(
                    height: 48.h,
                    width: 327.w,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF53C904), Color(0xFF2F7302)],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.r),
                      ),
                    ),
                    child: Center(
                      child: TextButton(
                        onPressed: () {
                          Platform.isIOS
                              ? _showDialogIOS(context)
                              : _showDialogAndroid(context);
                        },
                        child: const Text(
                          'Start planting',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void _showDialogIOS(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Confirm Selection'),
          content: Text(
              'Are you sure you want to start planting ${cropTypes[selectedIndex]}?'),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child:
                  const Text('Cancel', style: TextStyle(color: Colors.black)),
            ),
            TextButton(
              onPressed: () async {
                try {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString(
                      'selectedCrop', cropTypes[selectedIndex]);

                  // Оновлення в Provider
                  Provider.of<ChangeCropType>(context, listen: false)
                      .setSelectedCrop(cropTypes[selectedIndex]);

                  context.pop();
                  context.go('/base_screen');
                } catch (e) {
                  print('Error: $e');
                }
              },
              child: Text(
                'Confirm',
                style: TextStyle(color: Colors.green.shade500),
              ),
            ),
          ],
        );
      });
}

void _showDialogAndroid(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Confirm Selection'),
            content: Text(
                'Are you sure you want to start planting ${cropTypes[selectedIndex]}?'),
            actions: [
              TextButton(
                onPressed: () {
                  context.pop();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () async {
                  try {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString(
                        'selectedCrop', cropTypes[selectedIndex]);

                    Provider.of<ChangeCropType>(context, listen: false)
                        .setSelectedCrop(cropTypes[selectedIndex]);

                    context.pop();
                    context.go('/base_screen');
                  } catch (e) {
                    print('Error: $e');
                  }
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(color: Colors.green.shade500),
                ),
              ),
            ]);
      });
}
