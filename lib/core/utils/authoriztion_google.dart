import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

  Future<String?> getAuthorizationGoogle() async {
    FirebaseAuth auth=FirebaseAuth.instance;
    User? user;
    String? uid,email;
    // user = auth.currentUser;
    // uid = user?.uid;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if(googleUser!=null) {
      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential result = await auth.signInWithCredential(credential);

      // user = (await auth.signInWithCredential(credential)).user;
      user = result.user;
      email = auth.currentUser?.email;
      uid = auth.currentUser?.uid;
      return user?.email;
    }
  }
