import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/presentation/friend_list_screen/models/contact_list_model.dart';
import 'package:blaze_call/presentation/friend_list_screen/models/contactlist_item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FriendListController extends GetxController {
  Rx<ContactListModel> contactListModelObj = ContactListModel().obs;
  Rx<int> selectedIndex=0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  Stream <Rx<List<ContactListItemModel>>?> getContacts(String searchString) {

    Rx<List<ContactListItemModel>> allContacts = Rx<List<ContactListItemModel>>([]);
    ContactListItemModel x=ContactListItemModel();

    final requestsRef = FirebaseFirestore.instance.collection('users');

    return requestsRef.snapshots().map((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        if(searchString != '' && doc.id.contains(searchString)) {
          print("searchString: "+searchString);
          x.userName?.value = doc.id;
          x.firstName?.value = doc.data()['First Name'];
          x.lastName?.value = doc.data()['Last Name'];
          x.profilePicUrl?.value=doc.data()['profilePicURL'];
          allContacts!.value.add(x);
        }
      }
      return allContacts;
    });
  }
}
