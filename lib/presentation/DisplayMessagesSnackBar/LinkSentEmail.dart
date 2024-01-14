import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/presentation/DisplayMessagesSnackBar/DisplayMessage.dart';
import 'package:flutter/material.dart';
import '../../core/utils/authorization.dart';
class LinkSentEmail{
  Authorization authorization=Authorization();
  int display(){
    if (!authorization.user!.emailVerified) {
      DisplayMessage displayMessage=DisplayMessage();
      displayMessage.display("lbl_acc_not_verified".tr);
      return 0;
    }
    else{
      return 1;
    }
  }
}