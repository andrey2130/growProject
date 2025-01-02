import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:growproject/constants/textField.dart';
import 'package:growproject/constants/textStryle.dart';
import 'package:growproject/constants/services/sing_up.dart';
import 'package:growproject/constants/services/snack_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  TextEditingController passwordTextRepeatInputController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isHiddenConfirmPassword = true;
  bool isHiddenPassword = true;
  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();
    passwordTextRepeatInputController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void toggleConfirmPasswordView() {
    setState(() {
      isHiddenConfirmPassword = !isHiddenConfirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
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
                        Text('Create an account to start growing plants',
                            style: kSubtitleText),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 24.w,
                      right: 24.w,
                      bottom: 40.h,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Email',
                          style: kTextStyle,
                        ),
                        CustomTextFormField(
                          controller: emailTextInputController,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? 'Enter the correct Email'
                                  : null,
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
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              value != null && value.length < 6
                                  ? 'Minimum 6 characters required'
                                  : null,
                          isSuffixVisible: true,
                          onSuffixTap: togglePasswordView,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        const Text(
                          'Confirm Password',
                          style: kTextStyle,
                        ),
                        CustomTextFormField(
                          obscureText: isHiddenConfirmPassword,
                          controller: passwordTextRepeatInputController,
                          validator: (value) =>
                              value != null && value.length < 6
                                  ? 'Minimum 6 characters required'
                                  : null,
                          isSuffixVisible: true,
                          onSuffixTap: toggleConfirmPasswordView,
                        ),
                      ],
                    ),
                  ),
                  Center(
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
                                onPressed: () async {
                                  final email =
                                      emailTextInputController.text.trim();
                                  final password =
                                      passwordTextInputController.text.trim();
                                  final confirmPassword =
                                      passwordTextRepeatInputController.text
                                          .trim();

                                  if (email.isNotEmpty &&
                                      password.isNotEmpty &&
                                      confirmPassword.isNotEmpty) {
                                    await AuthService.signUp(
                                      context: context,
                                      email: email,
                                      password: password,
                                      confirmPassword: confirmPassword,
                                    );
                                  } else {
                                    SnackBarService.showSnackBar(
                                      context,
                                      'All fields must be filled in!',
                                      true,
                                    );
                                  }
                                },
                                child: const Text(
                                  'Sign up',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
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
                          'Already have an account?',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: () {
                            context.push('/SingInScreen');
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
      ),
    );
  }
}
