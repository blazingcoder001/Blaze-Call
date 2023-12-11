

import 'package:blaze_call/core/app_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'authorization.dart';

Future<int>emailSignIn(String email, String password) async {
  try {
    // Sign in with email and password
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email, password: password);
    // Check if the user's email is verified
    return 1;
  } on FirebaseAuthException catch (e) {
    // Handle authentication exceptions and notify the user
    if (Get.context!.mounted) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('User does not exist! Signup or Login with other methods to continue.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
    return 0;
  }
}