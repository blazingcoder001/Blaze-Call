

import 'package:blaze_call/core/utils/authorization.dart';
import 'package:blaze_call/presentation/friend_list_screen/models/contactlist_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<ContactListItemModel?> receiveFromDatabase(String username) async {
  ContactListItemModel x= ContactListItemModel();
  Authorization authorization=Authorization();
  authorization.initializeAuthorization();
  print(username);
 ContactListItemModel? result= await FirebaseFirestore.instance
      .collection('users')
      .doc(username)
      .get().then((docSnapshot){
    // return docSnapshot.data()?['Requests Sent'];
    x.userName!.value=username;
    x.profilePicUrl!.value=docSnapshot.data()?['profilePicURL'];
    x.lastName!.value=docSnapshot.data()?['Last Name'];
    x.firstName!.value=docSnapshot.data()?['First Name'];
    return x;
  });
 // Getting null for values in result. Need to debug.
 print("call from receive and convert to map.");
  return result;
}