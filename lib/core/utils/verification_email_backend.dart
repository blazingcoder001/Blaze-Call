import 'dart:async';

import 'package:blaze_call/core/utils/authorization.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<int?> verificationEmailBackend() async {
  int? k = 0;
  Authorization authorization = Authorization();
  authorization.user?.sendEmailVerification();
  final completer = Completer<void>();
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    authorization.user?.reload();
    StreamSubscription<User?>? authStateSubscription;
    authStateSubscription =
        authorization.auth.authStateChanges().listen((userFi) {
          if (userFi != null && userFi.emailVerified) {
            timer.cancel();
            authStateSubscription?.cancel();
            k = 1;
            completer.complete();
          }
        });
  });
  await completer.future;
  // print("object");
  return k;
}