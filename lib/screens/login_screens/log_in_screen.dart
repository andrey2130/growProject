import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:growproject/constants/textField.dart';
import 'package:growproject/constants/textStryle.dart';
import 'package:growproject/constants/services/sing_in.dart';
import 'package:growproject/constants/services/snack_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isHiddenPassword = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 34.h),
                    child: Image(
                      width: 84.w,
                      height: 84.h,
                      image: const AssetImage(
                        'images/title.jpg',
                      ),
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Welcome back', style: kTitleText),
                      Text('Sign in to grow your plants', style: kSubtitleText),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 24.w, right: 24.w, top: 40.h, bottom: 40.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: kTextStyle,
                        ),
                        CustomTextFormField(
                          controller: emailTextInputController,
                          validator: (email) {
                            if (email == null || email.isEmpty) {
                              return 'Email field cannot be empty';
                            }
                            if (!EmailValidator.validate(email)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        const Text(
                          'Password',
                          style: kTextStyle,
                        ),
                        CustomTextFormField(
                          controller: passwordTextInputController,
                          obscureText: isHiddenPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password field cannot be empty';
                            }
                            if (value.length < 6) {
                              return 'Minimum 6 characters required';
                            }
                            return null;
                          },
                          isSuffixVisible: true,
                          onSuffixTap: togglePasswordView,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.w, right: 24.w),
                    child: Center(
                      child: SizedBox(
                        width: 327.w,
                        height: 48.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12.r),
                                    ),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF53C904),
                                        Color(0xFF2F7302),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                child: TextButton(
                                  onPressed: () async {
                                    final email =
                                        emailTextInputController.text.trim();
                                    final password =
                                        passwordTextInputController.text.trim();

                                    if (formKey.currentState!.validate()) {
                                      final success = await AuthService().login(
                                        context: context,
                                        email: email,
                                        password: password,
                                      );

                                      if (success) {
                                        final prefs = await SharedPreferences
                                            .getInstance();
                                        await prefs.setString(
                                            'userEmail', email);
                                      } else {
                                        SnackBarService.showSnackBar(
                                          context,
                                          'Login failed. Please try again.',
                                          true,
                                        );
                                      }
                                    } else {
                                      SnackBarService.showSnackBar(
                                        context,
                                        'Please fill in all fields!',
                                        true,
                                      );
                                    }
                                  },
                                  child: const Text(
                                    'Sign in',
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
                          "Don't have an account?",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: () {
                            context.push('/SingUpScreen');
                          },
                          child: const Text(
                            'Sign up',
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
      ),
    );
  }
}
