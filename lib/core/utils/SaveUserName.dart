

import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> saveUserName(String username, String signInMethod) async {
  int result= await FirebaseFirestore.instance
      .collection('username')
      .doc(username)
      .set({'signInMethod':signInMethod}, SetOptions(merge: true)).then((value){
    return 1;
  }).catchError((onError){
    return 0;
  });
  return result;
}