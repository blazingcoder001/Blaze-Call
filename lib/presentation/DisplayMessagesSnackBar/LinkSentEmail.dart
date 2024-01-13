import 'package:blaze_call/core/app_export.dart';
import 'package:flutter/material.dart';
import '../../core/utils/authorization.dart';
class LinkSentEmail{
  Authorization authorization=Authorization();
  int display(){
    if (!authorization.user!.emailVerified) {
      // Send email verification and notify the user
      // authorization.user?.sendEmailVerification();
      if (Get.context!.mounted) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
           SnackBar(
            content: Text("lbl_acc_not_verified".tr),
            duration: Duration(seconds: 3),
          ),
        );
      }
      return 0;
    }
    else{
      return 1;
    }
  }
}