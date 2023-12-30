

import 'package:blaze_call/core/app_export.dart';

import 'package:blaze_call/presentation/DisplayMessagesSnackBar/DisplayMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../presentation/DisplayMessagesSnackBar/LinkSentEmail.dart';
import 'authorization.dart';

Future<int>emailSignIn(String email, String password) async {
  DisplayMessage displayMessage=DisplayMessage();
  try {
    Authorization authorization =Authorization();
    // Sign in with email and password
    UserCredential userCredential = await authorization.auth.signInWithEmailAndPassword(
        email: email, password: password);
    // Check if the user's email is verified
    LinkSentEmail accountExistsEmail=LinkSentEmail();
    accountExistsEmail.display();
    return 1;
  } on FirebaseAuthException catch (e) {
    // Handle authentication exceptions and notify the user
    displayMessage.display("Account does not exist for this email address.");
    return 0;
  }
}