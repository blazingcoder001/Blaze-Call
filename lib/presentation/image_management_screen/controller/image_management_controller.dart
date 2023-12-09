import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/presentation/image_management_screen/models/image_management_model.dart';

class ImageManagementController extends GetxController {
  Rx<ImageManagementModel> imageManagementModelObj = ImageManagementModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
