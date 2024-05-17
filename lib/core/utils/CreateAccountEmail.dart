

import 'package:firebase_auth/firebase_auth.dart';

import 'authorization.dart';

Future<int> createAccountEmail(String email, String password) async {
  print("CreateAccountEmail.dart called");
  try{
    Authorization authorization =Authorization();
    authorization.initializeAuthorization();
    UserCredential userCredential = await authorization.auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return 1;
  }
  on FirebaseAuthException catch (e){
    return 0;
  }
}