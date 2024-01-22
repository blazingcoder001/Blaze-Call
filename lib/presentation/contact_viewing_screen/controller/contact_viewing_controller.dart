import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/core/utils/requestSentAdd.dart';
import 'package:blaze_call/presentation/contact_viewing_screen/models/contact_viewng_model.dart';
import 'package:blaze_call/presentation/friend_list_screen/models/contactlist_item_model.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/requestSentReceive.dart';

class ContactViewingController extends GetxController {
  TextEditingController emailOneController = TextEditingController();

  TextEditingController group3670Controller = TextEditingController();

  Rx<ContactViewingModel> contactSharingModelObj = ContactViewingModel().obs;


  Future<List<ContactListItemModel>> future1(ContactListItemModel x){
    return requestSentReceive(x);
  }
  Future<int> future2(ContactListItemModel x, List<ContactListItemModel> list){
    return requestSentAdd(x, list);
  }
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailOneController.dispose();
    group3670Controller.dispose();
  }
}
