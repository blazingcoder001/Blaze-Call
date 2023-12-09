import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/presentation/user_account_screen/models/user_account_model.dart';

class UserAccountController extends GetxController {
  Rx<UserAccountModel> userAccountModelObj = UserAccountModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
