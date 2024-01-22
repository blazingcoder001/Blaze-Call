

import 'package:blaze_call/core/utils/authorization.dart';
import 'package:blaze_call/presentation/friend_list_screen/models/contactlist_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> requestSentAdd(ContactListItemModel passed, List<ContactListItemModel> receivedFromServer) async {
  Authorization authorization=Authorization();
  authorization.initializeAuthorization();
  receivedFromServer.add(passed);
  int result= await FirebaseFirestore.instance
      .collection('users')
      .doc(passed.userName?.value)
      .set({'Requests Sent':receivedFromServer}, SetOptions(merge: true)).then((value){
    return 1;
  }).catchError((onError){
    return 0;
  });
  return result;
}