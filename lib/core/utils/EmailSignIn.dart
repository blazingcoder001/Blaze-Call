

import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/presentation/DisplayMessages/AccountDoesNotExistEmail.dart';
import 'package:blaze_call/presentation/DisplayMessages/AccountExistsEmail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'authorization.dart';

Future<int>emailSignIn(String email, String password) async {
  try {
    // Sign in with email and password
    UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email, password: password);
    // Check if the user's email is verified
    AccountExistsEmail accountExistsEmail=AccountExistsEmail();
    accountExistsEmail.display();
    return 1;
  } on FirebaseAuthException catch (e) {
    // Handle authentication exceptions and notify the user
    AccountDoesNotExistEmail accountDoesNotExistEmail=AccountDoesNotExistEmail();
    accountDoesNotExistEmail.display();
    return 0;
  }
}