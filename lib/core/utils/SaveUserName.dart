

import 'package:blaze_call/core/utils/authorization.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> saveUserName(String username, String signInMethod) async {
  Authorization authorization=Authorization();
  int result= await FirebaseFirestore.instance
      .collection('UID')
      .doc(authorization.uid)
      .set({'signInMethod':signInMethod,'Username':username}, SetOptions(merge: true)).then((value){
    return 1;
  }).catchError((onError){
    return 0;
  });
  return result;
}