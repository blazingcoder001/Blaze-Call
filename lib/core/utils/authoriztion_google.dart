import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

  Future<String?> getAuthorizationGoogle() async {
    FirebaseAuth auth=FirebaseAuth.instance;
    User? user;
    String? uid;
    // user = auth.currentUser;
    // uid = user?.uid;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    user = (await auth.signInWithCredential(credential)).user;
    return user?.email;
  }
