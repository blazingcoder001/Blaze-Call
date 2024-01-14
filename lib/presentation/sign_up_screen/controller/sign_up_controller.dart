import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/core/utils/CreateAccountEmail.dart';
import 'package:blaze_call/core/utils/EmailSignIn.dart';
import 'package:blaze_call/core/utils/RemoveAccount.dart';
import 'package:blaze_call/core/utils/checkUserId.dart';
import 'package:blaze_call/core/utils/deleteUser.dart';
import 'package:blaze_call/core/utils/emailSignInOnly.dart';
import 'package:blaze_call/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/CheckUserName.dart';

class SignUpController extends GetxController {
  TextEditingController group10198Controller = TextEditingController();

  TextEditingController group10198OneController = TextEditingController();

  TextEditingController group10198TwoController = TextEditingController();

  TextEditingController group10198ThreeController = TextEditingController();

  TextEditingController group10198FourController = TextEditingController();

  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;

  Rx<bool> isShowPassword = true.obs;
  Future<int?> future1 (String username){
    return checkUserName(username);
  }
  Future<int?> future2 (String a,String b){
    return createAccountEmail(a, b);
  }
  Future<int?> future3(String? uid){
    return checkUID(uid);
  }
  Future<void> future4(String a, String b){
    return emailSignInOnly(a, b);
  }
  Future<int?> future5(){
    return removeAccount();
  }
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
    group10198ThreeController.dispose();
    group10198FourController.dispose();
  }
}
