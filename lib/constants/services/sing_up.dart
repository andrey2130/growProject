import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AuthService {
  static Future<void> signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (password != confirmPassword) {
      showSnackBar(
        context,
        'Passwords must match',
        true,
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      context.go('/OnBoardingScreen1');
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'email-already-in-use') {
        showSnackBar(
          context,
          'This Email is already in use, please try again with a different Email',
          true,
        );
        return;
      } else {
        showSnackBar(
          context,
          'Unknown error! Please try again or contact support.',
          true,
        );
      }
    }
  }

  static void showSnackBar(BuildContext context, String message, bool isError) {
    final color = isError ? Colors.red : Colors.green;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
  }
}
