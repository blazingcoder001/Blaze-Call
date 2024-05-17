import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/core/utils/authorization.dart';
import 'package:blaze_call/presentation/DisplayMessagesSnackBar/DisplayMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<int?>emailSignInOnly(String email, String password) async {
  print("emailSignInOnly.dart called");
  Authorization authorization=Authorization();
  authorization.initializeAuthorization();
  DisplayMessage displayMessage=DisplayMessage();
  try{
    await authorization.auth.signInWithEmailAndPassword(
        email: email, password: password);
    return 1;
  } on FirebaseAuthException catch (e) {
    // Handle authentication exceptions and notify the user
    displayMessage.display("lbl_acc_does_not_exist".tr);
    return 0;
  }}