

import 'package:blaze_call/core/utils/authorization.dart';
import 'package:blaze_call/presentation/friend_list_screen/models/contactlist_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<dynamic>> requestSentReceive(String passed) async {
  Authorization authorization=Authorization();
  authorization.initializeAuthorization();
  List<dynamic> result= await FirebaseFirestore.instance
      .collection('users')
      .doc(passed)
      .get().then((docSnapshot){
        return docSnapshot.data()?['Requests Sent'];
  }).catchError((onError){
    return [];
  });
  return result;
}