import 'package:firebase_auth/firebase_auth.dart';
class Authorization {
   FirebaseAuth auth=FirebaseAuth.instance;
   User? user;
   String? uid;
   initializeAuthorization(){
    user = auth.currentUser;
    uid = user?.uid;
  }
}
