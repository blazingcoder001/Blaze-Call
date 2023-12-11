import 'package:blaze_call/core/app_export.dart';
import 'package:flutter/material.dart';

class AccountDoesNotExistEmail{
  void display(){
    if (Get.context!.mounted) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('User does not exist! Signup or Login with other methods to continue.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

}