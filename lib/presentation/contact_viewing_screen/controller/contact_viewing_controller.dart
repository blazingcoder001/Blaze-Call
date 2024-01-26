import 'package:blaze_call/core/app_export.dart';
import 'package:blaze_call/core/utils/receiveUserDataFromDatabase.dart';
import 'package:blaze_call/core/utils/requestSentAdd.dart';
import 'package:blaze_call/presentation/contact_viewing_screen/models/contact_viewng_model.dart';
import 'package:blaze_call/presentation/friend_list_screen/models/contactlist_item_model.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/getUserName.dart';
import '../../../core/utils/requestPendingAdd.dart';
import '../../../core/utils/requestSentReceive.dart';
import '../../../core/utils/requestPendingReceive.dart';


class ContactViewingController extends GetxController {
  TextEditingController emailOneController = TextEditingController();

  TextEditingController group3670Controller = TextEditingController();

  Rx<ContactViewingModel> contactSharingModelObj = ContactViewingModel().obs;



  Future<String?> future1(){
    return getUserName();
  }
  Future<List<dynamic>> future2(String x){
    return requestSentReceive(x);
  }
  Future<int> future3(String username, ContactListItemModel x, List<dynamic> list){
    return requestSentAdd(username, x, list);
  }

  Future<List<dynamic>?> future4(String username){
    return requestPendingReceive(username);
  }
  Future<ContactListItemModel?> future5(String username){
    return receiveFromDatabase(username);
  }

  Future<int> future6(String username, ContactListItemModel x, List<dynamic> list){
    return requestPendingAdd(username, x, list);
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
