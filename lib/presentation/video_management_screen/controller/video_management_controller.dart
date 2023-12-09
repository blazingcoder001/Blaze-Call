import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/presentation/video_management_screen/models/video_management_model.dart';
import 'package:flutter/material.dart';

class VideoManagementController extends GetxController {
  TextEditingController inputFieldController = TextEditingController();

  Rx<VideoManagementModel> videoManagementModelObj = VideoManagementModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    inputFieldController.dispose();
  }
}
