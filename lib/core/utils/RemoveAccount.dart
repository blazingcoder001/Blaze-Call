import 'package:firebase_auth/firebase_auth.dart';

import 'authorization.dart';

Future<int?> removeAccount() async {
  Authorization authorization=Authorization();
  int? result= await authorization.user?.delete().then((value){
    return 1;

  }).catchError((onError){
    return 0;
  });
  return result;
}