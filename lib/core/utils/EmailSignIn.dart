

import 'package:blaze_call/core/app_export.dart';
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
    // Check if the user's email is verified
    LinkSentEmail accountExistsEmail=LinkSentEmail();
    int result1=accountExistsEmail.display();
    int? result2=await checkUID(authorization.uid);
    if(result1==0 || result2==0){
      await deleteUser();//Deletes user if the account is not verified.
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