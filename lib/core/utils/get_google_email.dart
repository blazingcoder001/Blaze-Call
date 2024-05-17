import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<String?> getGoogleEmail() async {
  print("authorization_google.dart called");

  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth =
  await googleUser?.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  UserCredential result = await auth.signInWithCredential(credential);

  user = result.user;
  var email = auth.currentUser?.email;
  return email;
}