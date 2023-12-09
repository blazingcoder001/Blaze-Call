import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/presentation/share_screen/models/share_model.dart';

class ShareController extends GetxController {
  Rx<ShareModel> shareModelObj = ShareModel().obs;

  Rx<bool> isCheckbox = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
