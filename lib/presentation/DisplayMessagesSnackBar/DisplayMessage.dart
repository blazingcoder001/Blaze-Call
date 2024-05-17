import 'package:blaze_call/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DisplayMessage{
  void display(String message){
    print("DisplayMessage.dart called");
    // if (Get.context!.mounted) {
    //   SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    //     ScaffoldMessenger.of(Get.context!).showSnackBar(
    //       SnackBar(
    //         content: Text(message),
    //         duration: Duration(seconds: 3),
    //       ),
    //     );
    //   });
    // }
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        Get.snackbar(
          "",
          message,
          icon: const Icon(Icons.add_alert),
        );
      });

  }
}