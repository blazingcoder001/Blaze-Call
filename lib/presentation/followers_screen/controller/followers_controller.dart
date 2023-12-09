import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/presentation/followers_screen/models/followers_model.dart';

class FollowersController extends GetxController {
  Rx<FollowersModel> followersModelObj = FollowersModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
