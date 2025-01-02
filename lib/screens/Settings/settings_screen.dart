import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:growproject/constants/textStryle.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool ventBoolValue = true;
  bool lighteningBoolValue = true;

  double ventValue = 12.0;
  double lighteningValue = 12.0;
  double temperatureValue = 12;
  double humidityValue = 12;
  double nutritionValue = 12;
  double wateringValue = 12;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Settings',
                    style: kTitleText,
                  ),
                ),
              ),
              CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.air, color: Colors.green),
                            SizedBox(width: 8.w),
                            const Text(
                              'Vent',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Switch.adaptive(
                          value: ventBoolValue,
                          onChanged: (bool value) {
                            setState(() {
                              HapticFeedback.lightImpact();
                              ventBoolValue = value;
                            });
                          },
                          activeColor: Colors.green,
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    CustomSlider(
                        value: ventValue,
                        min: 1,
                        max: 24,
                        text: '${ventValue.round()}h',
                        divisions: 23,
                        onChanged: (value) {
                          setState(() {
                            HapticFeedback.lightImpact();
                            ventValue = value;
                          });
                        }),
                    const SliderLabels(
                      startLabel: '1h',
                      middleLabel: '12h',
                      endLabel: '24h',
                    ),
                  ],
                ),
              ),
              CustomContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.lightbulb,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          const Text(
                            'Lightening',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Switch.adaptive(
                        value: lighteningBoolValue,
                        onChanged: (bool value) {
                          setState(() {
                            HapticFeedback.lightImpact();
                            lighteningBoolValue = value;
                          });
                        },
                        activeColor: Colors.green,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 295.w,
                    child: CustomSlider(
                        value: lighteningValue,
                        min: 1,
                        max: 16,
                        text: '${lighteningValue.round()}h',
                        divisions: 15,
                        onChanged: (double newValue) {
                          setState(() {
                            HapticFeedback.lightImpact();
                            lighteningValue = newValue;
                          });
                        }),
                  ),
                  const SliderLabels(
                    startLabel: '1h',
                    middleLabel: '8h',
                    endLabel: '16h',
                  ),
                ],
              )),
              CustomContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.thermostat,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          const Text(
                            'Temperature',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 295.w,
                    child: CustomSlider(
                        value: temperatureValue,
                        min: 10,
                        max: 36,
                        text: '${temperatureValue.round()}`С',
                        divisions: 36,
                        onChanged: (double newValue) {
                          setState(() {
                            HapticFeedback.lightImpact();
                            temperatureValue = newValue;
                          });
                        }),
                  ),
                  const SliderLabels(
                    startLabel: '10°C',
                    middleLabel: '24°C',
                    endLabel: '36°C',
                  ),
                ],
              )),
              CustomContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.opacity,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          const Text(
                            'Humidity',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 295.w,
                    child: CustomSlider(
                        value: humidityValue,
                        min: 0,
                        max: 100,
                        text: '${humidityValue.round()}%',
                        divisions: 100,
                        onChanged: (double newValue) {
                          setState(() {
                            HapticFeedback.lightImpact();
                            humidityValue = newValue;
                          });
                        }),
                  ),
                  const SliderLabels(
                    startLabel: 'off',
                    middleLabel: '50%',
                    endLabel: '100%',
                  ),
                ],
              )),
              CustomContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.seedling,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          const Text(
                            'Nutririon',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 295.w,
                    child: CustomSlider(
                        value: nutritionValue,
                        min: 0,
                        max: 500,
                        text: '${nutritionValue.round()}mg',
                        divisions: 500,
                        onChanged: (double newValue) {
                          setState(() {
                            HapticFeedback.lightImpact();
                            nutritionValue = newValue;
                          });
                        }),
                  ),
                  const SliderLabels(
                    startLabel: 'off',
                    middleLabel: '250mg',
                    endLabel: '500mg',
                  ),
                ],
              )),
              CustomContainer(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.water_outlined,
                            color: Colors.green,
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          const Text(
                            'Watering',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 295.w,
                    child: CustomSlider(
                        value: wateringValue,
                        min: 0,
                        max: 500,
                        text: '${wateringValue.round()}mg',
                        divisions: 500,
                        onChanged: (double newValue) {
                          setState(() {
                            HapticFeedback.lightImpact();
                            wateringValue = newValue;
                          });
                        }),
                  ),
                  const SliderLabels(
                    startLabel: 'off',
                    middleLabel: '250mg',
                    endLabel: '500mg',
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final int? divisions;
  final String text;

  const CustomSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 500,
    this.divisions,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        activeTrackColor: Colors.green,
        inactiveTrackColor: Colors.green.shade100,
        thumbColor: Colors.green,
        valueIndicatorColor: Colors.green,
      ),
      child: Slider(
        value: value,
        min: min,
        max: max,
        divisions: divisions,
        label: text,
        onChanged: onChanged,
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? margin;

  const CustomContainer({
    super.key,
    required this.child,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      margin: margin ??
          EdgeInsets.only(left: 24.w, right: 24.w, top: 10.h, bottom: 10.h),
      padding:
          EdgeInsets.only(top: 12.h, left: 16.w, right: 16.w, bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}

class SliderLabels extends StatelessWidget {
  final String startLabel;
  final String middleLabel;
  final String endLabel;

  const SliderLabels({
    super.key,
    required this.startLabel,
    required this.middleLabel,
    required this.endLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(startLabel, style: const TextStyle(color: Colors.green)),
        Text(middleLabel, style: const TextStyle(color: Colors.green)),
        Text(endLabel, style: const TextStyle(color: Colors.green)),
      ],
    );
  }
}
