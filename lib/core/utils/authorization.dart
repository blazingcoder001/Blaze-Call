import 'package:firebase_auth/firebase_auth.dart';
class Authorization {
   FirebaseAuth auth=FirebaseAuth.instance;
   User? user;
   String? uid;
   Authorization(){
    user = auth.currentUser;
    uid = user?.uid;
  }
}
