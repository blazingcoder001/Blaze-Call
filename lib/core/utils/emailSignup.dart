import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'authorization.dart';

Future<int?> emailSignup(String firstName, String lastName, String email, String username) async {
  // Retrieve user information from Firestore
  int? result;
  Authorization authorization =Authorization();
  result= await FirebaseFirestore.instance
      .collection('users')
      .doc(authorization.uid)
      .get()
      .then((docSnapshot) async {

    // Check if the user exists
    if (!docSnapshot.exists) {
      // Debugging: Print when the user does not exist
      if (kDebugMode) {
        print('User does not exist from emailSignup');
      }
      int result2;

      // Create a new document for the user in Firestore
     result2=await FirebaseFirestore.instance
          .collection('users')
          .doc(authorization.uid)
          .set({'First Name': firstName, 'Last Name':lastName, 'email': email, 'signInMethod':'email','Username': username}, SetOptions(merge: true))
         .then(
              (value) {
            // Debugging: Print when the document is created successfully
            if (kDebugMode) {
              print('Document created successfully from emailSignup!');
            }
            return 1;
          }).catchError((error) {
        // Debugging: Print if there's an error creating the document
        if (kDebugMode) {
          print('Failed to create document from emailSignup: $error');
        }
        return 0;
      });
     return result2;
    }
    else{
      print("User Exists for this uid."+ authorization.uid.toString());
    }
  });
  return result;
  // return 2;

}