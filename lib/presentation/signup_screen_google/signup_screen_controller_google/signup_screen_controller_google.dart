import 'dart:typed_data';

import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/core/utils/CreateAccountEmail.dart';
import 'package:blaze_call/core/utils/EmailSignIn.dart';
import 'package:blaze_call/core/utils/RemoveAccount.dart';
import 'package:blaze_call/core/utils/authoriztion_google.dart';
import 'package:blaze_call/core/utils/checkUserId.dart';
import 'package:blaze_call/core/utils/deleteUser.dart';
import 'package:blaze_call/core/utils/emailSignInOnly.dart';
import 'package:blaze_call/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/CheckUserName.dart';
import '../../../core/utils/SaveUserName.dart';
import '../../../core/utils/defaultprofilepiccreator.dart';
import '../../../core/utils/emailSignup.dart';
import '../../../core/utils/pic_upload.dart';

class SignUpControllerGoogle extends GetxController {
  TextEditingController group10198Controller = TextEditingController();

  TextEditingController group10198OneController = TextEditingController();

  // TextEditingController group10198TwoController = TextEditingController();

  TextEditingController group10198ThreeController = TextEditingController();

  // TextEditingController group10198FourController = TextEditingController();

  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;

  Rx<bool> isShowPassword = true.obs;
  Future<int?> future1 (String username){
    return checkUserName(username);
  }
  Future<ByteData?> future2(String x){
    return createPic(x);
  }
  Future<String> future3(ByteData pic){
    return picUpload(pic);
  }
  Future<String?> future4(){
    return getAuthorizationGoogle();
  }
  Future<int?> future5(firstName, lastName, email, username, url, signInMethod){
    return emailSignup(firstName, lastName, email, username, url, signInMethod);
  }

  Future<int?> future6(username, signInMethod){
    return saveUserName(username, signInMethod);
  }
  // Future<int?> future2 (String a,String b){
  //   return createAccountEmail(a, b);
  // }
  // Future<void> future3(String a, String b){
  //   return emailSignInOnly(a, b);
  // }
  // Future<int?> future4(String? uid){
  //   return checkUID(uid);
  // }
  //
  // Future<int?> future5(){
  //   return removeAccount();
  // }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    group10198Controller.dispose();
    group10198OneController.dispose();
    // group10198TwoController.dispose();
    group10198ThreeController.dispose();
    // group10198FourController.dispose();
  }
}
