import 'package:blaze_call/core/app_export.dart';
import 'package:flutter/material.dart';
import '../../core/utils/authorization.dart';
class LinkSentEmail{
  Authorization authorization=Authorization();
  void display(){
    if (!authorization.user!.emailVerified) {
      // Send email verification and notify the user
      authorization.user?.sendEmailVerification();
      if (Get.context!.mounted) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(
            content: Text('A link has been sent to your email address. Please verify to continue.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }
}