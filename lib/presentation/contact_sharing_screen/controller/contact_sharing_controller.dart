import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/presentation/contact_sharing_screen/models/contact_sharing_model.dart';
import 'package:flutter/material.dart';

class ContactSharingController extends GetxController {
  TextEditingController emailOneController = TextEditingController();

  TextEditingController group3670Controller = TextEditingController();

  Rx<ContactSharingModel> contactSharingModelObj = ContactSharingModel().obs;

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
