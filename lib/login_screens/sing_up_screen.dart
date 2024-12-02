import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:growproject/constants/textField.dart';
import 'package:growproject/constants/textStryle.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image(
                    width: 84,
                    height: 84,
                    image: AssetImage(
                      'images/title.jpg',
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Create an account', style: kTitleText),
                      Text('Create an acoount to start growing plants',
                          style: kSubtitleText),
                    ],
                  ),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: kTextStyle,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: CustomTextField(
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Text(
                      'Password',
                      style: kTextStyle,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: CustomTextField(
                        isPassword: true,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Text(
                      'Confirm Password',
                      style: kTextStyle,
                    ),
                    Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: CustomTextField(
                          isPassword: true,
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Center(
                    child: SizedBox(
                      height: 48,
                      width: 327,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF53C904),
                                      Color(0xFF2F7302),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: () {
                                  context.go('/OnBoardingScreen1');
                                },
                                child: const Text(
                                  'Sing up',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have account?',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      TextButton(
                        onPressed: () {
                          context.go('/SingInScreen');
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            color: Color(0xFF2F7302),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
