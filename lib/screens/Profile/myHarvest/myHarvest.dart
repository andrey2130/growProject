import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:growproject/constants/textStryle.dart';

var totalDays = 93;
var harvest = 3;

class Myharvest extends StatelessWidget {
  const Myharvest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'My Harvest',
          style: kTitleText,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
              child: Column(
                children: [
                  Row(children: [
                    const HarvestCard(
                      title: 'Microgreens',
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    const HarvestCard(
                      title: 'Herbs',
                    ),
                  ]),
                  SizedBox(
                    height: 16.w,
                  ),
                  Row(children: [
                    const HarvestCard(
                      title: 'Microgreens',
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    const HarvestCard(
                      title: 'Herbs',
                    ),
                  ]),
                  SizedBox(
                    height: 16.w,
                  ),
                  Row(children: [
                    const HarvestCard(
                      title: 'Microgreens',
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    const HarvestCard(
                      title: 'Herbs',
                    ),
                  ])
                ],
              )),
        ),
      ),
    );
  }
}

class HarvestCard extends StatelessWidget {
  final String title;
  const HarvestCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 151.w,
        height: 171.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1.r,
              blurRadius: 5.r,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(height: 60.h, width: 60.w, 'images/image copy 2.png'),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.green.shade500,
                ),
              ),
              RichText(
                text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      const TextSpan(
                          text: 'Harvest: ',
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: '$harvest',
                          style: TextStyle(
                            color: Colors.green.shade800,
                          ))
                    ]),
              ),
              RichText(
                text: TextSpan(
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                    children: [
                      const TextSpan(text: 'Total Days: '),
                      TextSpan(
                        text: '$totalDays',
                        style: TextStyle(
                          color: Colors.green.shade800,
                        ),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
