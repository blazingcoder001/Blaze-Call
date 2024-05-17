import 'package:blaze_call/core/utils/authorization.dart';
import 'package:blaze_call/presentation/friend_list_screen/models/contactlist_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<int> requestPendingAdd(String username, ContactListItemModel passed, List<dynamic> receivedFromServer) async {
  print("requestPendingAdd.dart called");
  Authorization authorization=Authorization();
  authorization.initializeAuthorization();
  // List<ContactListItemModel> contacts = receivedFromServer.map((e) => e as ContactListItemModel).toList();
  // print("from add:"+receivedFromServer.length.toString());
  receivedFromServer.add(passed.toMap());
  // print(contacts);
  // print("from add:"+receivedFromServer.length.toString());
  int result= await FirebaseFirestore.instance
      .collection('users')
      .doc(username)
      .set({'Requests Pending':receivedFromServer}, SetOptions(merge: true)).then((value){
    return 1;
  }).catchError((onError){
    print(onError);
    return 0;
  });
  return result;
}
