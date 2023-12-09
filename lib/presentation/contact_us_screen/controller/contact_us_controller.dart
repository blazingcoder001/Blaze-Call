import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/presentation/contact_us_screen/models/contact_us_model.dart';
import 'package:flutter/material.dart';

class ContactUsController extends GetxController {
  TextEditingController group10198Controller = TextEditingController();

  TextEditingController group10198OneController = TextEditingController();

  TextEditingController group10198TwoController = TextEditingController();

  TextEditingController group10199Controller = TextEditingController();

  Rx<ContactUsModel> contactUsModelObj = ContactUsModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    group10198Controller.dispose();
    group10198OneController.dispose();
    group10198TwoController.dispose();
    group10199Controller.dispose();
  }
}
