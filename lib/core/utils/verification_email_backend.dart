import 'dart:async';

import 'package:blaze_call/core/utils/authorization.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<int?> verificationEmailBackend() async {
  int? k = 0;
  Authorization authorization = Authorization();
  authorization.initializeAuthorization();
  authorization.user?.sendEmailVerification();
  // StreamSubscription<User?>? authStateSubscription;
  final completer=Completer<void>();
  int counter=300;
  Timer.periodic(const Duration(seconds: 1), (timer)  async {
    counter--;
    print(timer.tick);
    await authorization.user?.reload();
        authorization.auth.authStateChanges().listen((userFi)  {
          if (userFi != null && userFi.emailVerified) {
            timer.cancel();
            k = 1;
            if(!completer.isCompleted) {
              completer.complete();
            }
          }
          else if(userFi==null || counter==0){
            timer.cancel();
            k = -1;
            if(!completer.isCompleted) {
              completer.complete();
            }
          }
        });
  });
  await completer.future;
  return k;
}