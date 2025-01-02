import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeAppScreen extends StatelessWidget {
  const WelcomeAppScreen({super.key});

  Future<void> checkLoginStatus(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('userEmail');

    if (email != null) {
      context.go('/base_screen');
    } else {
      context.go('/SingInScreen');
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      checkLoginStatus(context);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                'images/title.jpg',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome to App',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Spacer(flex: 7),
          ],
        ),
      ),
    );
  }
}
