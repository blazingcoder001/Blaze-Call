import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/presentation/contact_viewing_screen/models/contact_viewng_model.dart';
import 'package:flutter/material.dart';

class ContactViewingController extends GetxController {
  TextEditingController emailOneController = TextEditingController();

  TextEditingController group3670Controller = TextEditingController();

  Rx<ContactViewingModel> contactSharingModelObj = ContactViewingModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailOneController.dispose();
    group3670Controller.dispose();
  }
}
