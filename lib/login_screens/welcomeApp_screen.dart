import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeAppScreen extends StatelessWidget {
  const WelcomeAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    Future.delayed(const Duration(seconds: 1), () {
      context.go('/SingupScreen'); 
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
