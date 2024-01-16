import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/core/utils/EmailSignIn.dart';
import 'package:blaze_call/core/utils/authoriztion_google.dart';
import 'package:blaze_call/core/utils/checkUserId.dart';
import 'package:blaze_call/presentation/signup_login_module_screen/models/signup_login_module_model.dart';
import 'package:flutter/material.dart';

class SignupLoginModuleController extends GetxController {
  TextEditingController group10198Controller = TextEditingController();

  TextEditingController group10198OneController = TextEditingController();

  Rx<SignupLoginModuleModel> signupLoginModuleModelObj =
      SignupLoginModuleModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isCheckbox = false.obs;


  Future<int?> future1(String x, String y){
    return emailSignIn(x, y);
  }
  Future<String?> future2(){
    return getAuthorizationGoogle();
  }
  Future<int?> future3(String? uid){
    return checkUID(uid);
  }


 @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    group10198Controller.dispose();
    group10198OneController.dispose();
  }
}
