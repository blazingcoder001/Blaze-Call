

import 'package:firebase_auth/firebase_auth.dart';

Future<void> deleteUser() async {
  print("deleteUser.dart called");
  await FirebaseAuth.instance.currentUser!.delete();
}