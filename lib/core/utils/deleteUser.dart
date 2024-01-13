

import 'package:firebase_auth/firebase_auth.dart';

Future<void> deleteUser() async {
await FirebaseAuth.instance.currentUser!.delete();
}