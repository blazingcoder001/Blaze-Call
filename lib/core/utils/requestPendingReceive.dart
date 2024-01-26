

import 'package:blaze_call/core/utils/authorization.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<dynamic>?> requestPendingReceive(String username) async {
  Authorization authorization=Authorization();
  authorization.initializeAuthorization();
  List<dynamic>? result= await FirebaseFirestore.instance
      .collection('users')
      .doc(username)
      .get().then((docSnapshot){
        if(docSnapshot.data()?['Requests Pending']!=null) {
          return docSnapshot.data()?['Requests Pending'];
        }
        else{
          return [];
        }
  }).catchError((onError){
    return null;
  });
  return result;
}