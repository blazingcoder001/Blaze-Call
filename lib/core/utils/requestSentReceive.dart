

import 'package:blaze_call/core/utils/authorization.dart';
import 'package:blaze_call/presentation/friend_list_screen/models/contactlist_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<ContactListItemModel>> requestSentReceive(ContactListItemModel passed) async {
  Authorization authorization=Authorization();
  authorization.initializeAuthorization();
  List<ContactListItemModel> result= await FirebaseFirestore.instance
      .collection('users')
      .doc(passed.userName?.value)
      .get().then((docSnapshot){
        return docSnapshot.data()?['Requests Sent'];
  }).catchError((onError){
    return [];
  });
  return result;
}