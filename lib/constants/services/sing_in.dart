import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:growproject/constants/services/snack_bar.dart';

class AuthService {
  Future<bool> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Успішний вхід
      SnackBarService.showSnackBar(
        context,
        'Login successful!',
        false,
      );
      context.go('/base_screen'); // Navigate to the main screen
      return true;
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      switch (e.code) {
        case 'user-not-found':
        case 'wrong-password':
          errorMessage = 'Incorrect email or password. Please try again.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email format.';
          break;
        default:
          errorMessage = e.message ?? 'Unknown error! Please try again.';
      }

      SnackBarService.showSnackBar(context, errorMessage, true);
      return false;
    } catch (e) {
      SnackBarService.showSnackBar(
        context,
        'Unknown error! Please try again.',
        true,
      );
      return false;
    }
  }
}
