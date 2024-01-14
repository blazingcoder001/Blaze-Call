import 'dart:async';

import 'package:blaze_call/core/utils/authorization.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<int?> verificationEmailBackend() async {
  int? k = 0;
  Authorization authorization = Authorization();
  authorization.user?.sendEmailVerification();
  StreamSubscription<User?>? authStateSubscription;
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    await authorization.user?.reload();
    authStateSubscription =
        authorization.auth.authStateChanges().listen((userFi) {
          if (userFi != null && userFi.emailVerified) {
            timer.cancel();
            authStateSubscription?.cancel();
            k = 1;
          }
          else if(userFi==null){
            timer.cancel();
            authStateSubscription?.cancel();
            k = 1;
          }
        });
  });
  return k;
}