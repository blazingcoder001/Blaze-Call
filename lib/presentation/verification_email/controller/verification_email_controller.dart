
import 'dart:async';
import 'dart:typed_data';
import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/core/utils/SaveUserName.dart';
import 'package:blaze_call/core/utils/emailSignup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/utils/authorization.dart';
import '../../../core/utils/defaultprofilepiccreator.dart';
import '../../../core/utils/pic_upload.dart';
import '../../../core/utils/verification_email_backend.dart';

class VerificationEmailController extends GetxController {

  Future<int?> future1(){
    return verificationEmailBackend();
  }

  Future<ByteData?> future2(String x){
    return createPic(x);
  }
  Future<String> future3(ByteData pic){
    return picUpload(pic);
  }
  Future<int?> future4(firstName, lastName, email, username, url, signInMethod){
    return emailSignup(firstName, lastName, email, username, url, signInMethod);
  }

  Future<int?> future5(username, signInMethod){
    return saveUserName(username, signInMethod);
  }

  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
