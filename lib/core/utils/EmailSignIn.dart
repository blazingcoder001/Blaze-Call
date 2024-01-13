

import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/core/utils/deleteUser.dart';
import 'package:blaze_call/core/utils/verification_email_backend.dart';

import 'package:blaze_call/presentation/DisplayMessagesSnackBar/DisplayMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../presentation/DisplayMessagesSnackBar/LinkSentEmail.dart';
import 'authorization.dart';

Future<int?>emailSignIn(String email, String password) async {
  DisplayMessage displayMessage=DisplayMessage();
  try {
    Authorization authorization =Authorization();
    // Sign in with email and password
    UserCredential userCredential = await authorization.auth.signInWithEmailAndPassword(
        email: email, password: password);
    // Check if the user's email is verified
    LinkSentEmail accountExistsEmail=LinkSentEmail();
    int result=accountExistsEmail.display();
    // return result;
    // int? result2=1;
    // if(result==0){
    //   Get.toNamed(AppRoutes.signUpScreen);
    //   // result2= await verificationEmailBackend();
    // }
    if(result==0){
      await deleteUser();//Deletes user if the account is not verified.
    }
    return result;
  } on FirebaseAuthException catch (e) {
    // Handle authentication exceptions and notify the user
    displayMessage.display("lbl_acc_does_not_exist".tr);
    return 0;
  }
}