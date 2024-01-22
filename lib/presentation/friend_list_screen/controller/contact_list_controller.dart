
import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/core/utils/authorization.dart';
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

    final requestsRef = FirebaseFirestore.instance.collection('users');

    return requestsRef.snapshots().map((querySnapshot) {
      for (var doc in querySnapshot.docs) {

        Authorization authorization=Authorization();
        authorization.initializeAuthorization();
        if(searchString != '' && doc.id.contains(searchString)  && doc.data()['UID']!=authorization.uid)
        {
          ContactListItemModel x=ContactListItemModel();// the reason why we are creating a new instance of x inside each iteration is because,
          // x shares the same memory location. Even though we update the value of x in the second iteration, the value of x added in the previous iteration also changes. That is
          //why getting same multiple list values.
          print("searchString: "+searchString);
          x.userName?.value = doc.id;
          // print("x.username: "+x.userName!.value+"doc.id: "+doc.id);
          x.firstName?.value = doc.data()['First Name'];
          x.lastName?.value = doc.data()['Last Name'];
          x.profilePicUrl?.value=doc.data()['profilePicURL'];
          print(x.userName);
          allContacts.value.add(x);
        }
      }
      // print(allContacts.value[0].userName!);
      // print(allContacts.value[1].userName!);
      return allContacts;
    });
  }
}
