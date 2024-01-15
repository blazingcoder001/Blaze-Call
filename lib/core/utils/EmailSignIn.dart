

import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/core/utils/RemoveAccount.dart';
import 'package:blaze_call/core/utils/checkUserId.dart';
import 'package:blaze_call/core/utils/deleteUser.dart';
import 'package:blaze_call/presentation/DisplayMessagesSnackBar/DisplayMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../presentation/DisplayMessagesSnackBar/LinkSentEmail.dart';
import 'authorization.dart';

Future<int?>emailSignIn(String email, String password) async {
  DisplayMessage displayMessage=DisplayMessage();
  try {
    Authorization authorization =Authorization();
    // Sign in with email and password
    UserCredential userCredential = await authorization.auth.signInWithEmailAndPassword(
        email: email, password: password);
    authorization.initializeAuthorization();

    // Check if the user's email is verified
    LinkSentEmail accountExistsEmail=LinkSentEmail();
    int result1=accountExistsEmail.display();
    int? result2=await checkUID(authorization.uid);
    int? result3;
    if(result1==0 || result2==0){
      result3=await removeAccount();//Deletes user if the account is not verified.
    }
    if(result3==0){
      displayMessage.display("lbl_some_error".tr);
      return 0;
    }
    if(result1==1 && result2==0){
      displayMessage.display("lbl_acc_not_verified".tr);
    }
   if(result1==0 || result2==0){
     return 0;
   }
   else if(result1 ==1 && result2==1){
     return 1;
   }
  } on FirebaseAuthException catch (e) {
    // Handle authentication exceptions and notify the user
    displayMessage.display("lbl_acc_does_not_exist".tr);
    return 0;
  }
}