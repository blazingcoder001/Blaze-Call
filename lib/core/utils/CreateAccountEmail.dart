

import 'package:firebase_auth/firebase_auth.dart';

import 'authorization.dart';

Future<int> createAccountEmail(String email, String password) async {
  try{
    Authorization authorization =Authorization();
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